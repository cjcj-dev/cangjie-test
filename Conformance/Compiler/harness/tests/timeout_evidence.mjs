#!/usr/bin/env zx
import assert from 'node:assert/strict';
import fs from 'node:fs/promises';
import path from 'node:path';
import {fileURLToPath} from 'node:url';
import {spawn} from 'node:child_process';

const harness = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..', 'harness.py');
const root = process.argv[2];
if (!root || !path.isAbsolute(root)) throw Error('Supply a new absolute output directory');
await fs.mkdir(root);
const source = root + '/source';
await fs.mkdir(source);
await fs.writeFile(source + '/test_timeout_evidence.cj', `/*
 @Name: timeout_evidence_control
 @Mode: compileonly
 @Negative: no
 @CompileWarning: no
*/
main() {}
`);
const fixture = root + '/compiler-fixture.mjs';
await fs.writeFile(fixture, `import fs from 'node:fs';
if (process.argv.includes('--version')) { console.log('Cangjie Compiler: timeout evidence fixture'); process.exit(0); }
fs.appendFileSync(process.env.FIXTURE_EVENTS, JSON.stringify({event:'start',pid:process.pid,ppid:process.ppid,argv:process.argv})+'\\n');
process.stdout.write('stdout-before-wait\\n');
process.stderr.write('stderr-before-wait\\n');
if (process.env.FIXTURE_MODE === 'normal') process.exit(0);
if (process.env.FIXTURE_MODE === 'exit127') process.exit(127);
if (process.env.FIXTURE_MODE === 'term7') process.on('SIGTERM', () => {
  process.stderr.write('stderr-on-term\\n');
  fs.appendFileSync(process.env.FIXTURE_EVENTS, JSON.stringify({event:'TERM',pid:process.pid,exit:7})+'\\n');
  process.exit(7);
});
setInterval(() => {}, 1000);
`);
const results = [];
for (const mode of ['normal', 'exit127', 'timeout', 'term7']) {
  const work = root + '/' + mode;
  await fs.mkdir(work);
  const argv = ['/usr/bin/python3', harness, '--test-root', source, '--tests', source + '/test_timeout_evidence.cj',
    '--work-dir', work + '/work', '--cjc', 'exec ' + process.execPath + ' ' + fixture,
    '--comp-threads', '1', '--exec-threads', '1', '--base-timeout', '0.5',
    '--log-file', work + '/results.log', '--no-color', '--log-mode', 'short'];
  const env = {...process.env, PYTHONDONTWRITEBYTECODE:'1', FIXTURE_MODE:mode, FIXTURE_EVENTS:work + '/events.jsonl'};
  const row = {mode, argv, cwd:root, start:new Date().toISOString()};
  const out = await fs.open(work + '/parent.stdout', 'wx');
  const err = await fs.open(work + '/parent.stderr', 'wx');
  const proc = spawn(argv[0], argv.slice(1), {cwd:root, env, stdio:['ignore', out.fd, err.fd]});
  row.parentPID = proc.pid;
  Object.assign(row, await new Promise((resolve,reject) => {proc.on('error', reject); proc.on('close', (rc,signal) => resolve({rc,signal}));}));
  row.end = new Date().toISOString();
  await out.close(); await err.close();
  const records = JSON.parse(await fs.readFile(work + '/results.log.json', 'utf8')).filter(x => x.name);
  assert.equal(records.length, 1);
  row.record = records[0];
  row.events = (await fs.readFile(work + '/events.jsonl', 'utf8')).trim().split('\n').map(x => JSON.parse(x));
  const text = row.record.compile_log.replace(/\x1b\[[0-9;]*m/g, '');
  const timed = ['timeout','term7'].includes(mode);
  row.failures = [];
  const check = (condition, message) => { if (!condition) row.failures.push(message); };
  check(row.rc === 0 && !row.signal, 'public harness parent did not exit normally');
  check(text.includes('stderr-before-wait'), 'original stderr was lost');
  check(text.includes('stdout-before-wait'), 'original stdout was lost');
  check(text.includes('return code: ' + (mode === 'normal' ? '0' : '127')), 'compatibility code changed');
  check(row.record.result === (mode === 'normal' ? 'PASSED' : 'ERRORED'), 'verdict changed');
  check(timed === text.includes('second timeout has expired'), 'timeout classified incorrectly');
  if (timed) {
    check(text.includes('timed out: True'), 'missing separate timeout flag');
    check(text.includes('waited process return code: ' + (mode === 'term7' ? '7' : '-15')), 'missing real wait return code');
    check(text.includes('waited process pid: ' + row.events[0].pid), 'wait pid differs from exec child');
    if (mode === 'term7') check(text.includes('stderr-on-term') && row.events.some(x => x.event === 'TERM'), 'post-TERM stderr lost');
  } else check(!text.includes('timed out: True'), 'normal exit was labeled timeout');
  row.pass = row.failures.length === 0;
  results.push(row);
  await fs.writeFile(root + '/result.json', JSON.stringify({harness,results},null,2) + '\n');
  console.log(JSON.stringify({mode, parentRC:row.rc, result:row.record.result, pass:row.pass, failures:row.failures}));
}
assert.ok(results.every(x => x.pass), 'public harness timeout evidence controls failed');
