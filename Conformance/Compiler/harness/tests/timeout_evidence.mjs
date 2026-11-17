#!/usr/bin/env zx
import assert from 'node:assert/strict';
import fs from 'node:fs/promises';
import path from 'node:path';
import {fileURLToPath} from 'node:url';
import {spawn} from 'node:child_process';

const harness = process.argv[3] || path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..', 'harness.py');
const root = process.argv[2];
if (process.platform !== 'linux') throw Error('These process-group controls require Linux');
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
await fs.writeFile(fixture, String.raw`import fs from 'node:fs';
if (process.argv.includes('--version')) { console.log('Cangjie Compiler: timeout evidence fixture'); process.exit(0); }
const fields=fs.readFileSync('/proc/self/stat','utf8').split(') ').at(-1).trim().split(/\s+/);
const event=x=>fs.appendFileSync(process.env.FIXTURE_EVENTS,JSON.stringify(x)+'\n');
event({event:'start',pid:process.pid,ppid:process.ppid,pgid:Number(fields[2]),startTicks:fields[19],argv:process.argv});
process.stdout.write('stdout-before-wait\n');
process.stderr.write('stderr-before-wait\n');
if (process.env.FIXTURE_MODE === 'normal') process.exit(0);
if (process.env.FIXTURE_MODE === 'exit127') process.exit(127);
if (process.env.FIXTURE_MODE === 'term7') process.on('SIGTERM', () => {
  process.stderr.write('stderr-on-term\n'); event({event:'TERM',pid:process.pid,exit:7}); process.exit(7);
});
if (['ignoreterm','descendant'].includes(process.env.FIXTURE_MODE)) {
  process.on('SIGTERM',()=>{process.stderr.write('stderr-ignored-term\n');event({event:'ignored-TERM',pid:process.pid});});
  // Fixture-only natural safety limit: the old runner returns too late, but
  // does not leave an infinite child when demonstrating the counterexample.
  setTimeout(()=>process.exit(0),4000);
} else setInterval(()=>{},1000);
`);
const results = [];
const stat = async pid => {
  try { const s=await fs.readFile('/proc/'+pid+'/stat','utf8'),f=s.split(') ').at(-1).trim().split(/\s+/);return {state:f[0],pgid:Number(f[2]),startTicks:f[19]}; }
  catch(e) { if(e.code==='ENOENT')return null;throw e; }
};
for (const mode of ['normal','exit127','timeout','term7','ignoreterm','descendant']) {
  const work=root+'/'+mode;await fs.mkdir(work);
  // descendant deliberately uses the ordinary shell=True path without exec:
  // the shell exits on TERM while its TERM-ignoring child holds both pipes.
  const command=(mode==='descendant'?'':'exec ')+process.execPath+' '+fixture;
  const argv=['/usr/bin/python3',harness,'--test-root',source,'--tests',source+'/test_timeout_evidence.cj',
    '--work-dir',work+'/work','--cjc',command,'--comp-threads','1','--exec-threads','1',
    '--base-timeout','0.5','--log-file',work+'/results.log','--no-color','--log-mode','short'];
  const env={...process.env,PYTHONDONTWRITEBYTECODE:'1',FIXTURE_MODE:mode,FIXTURE_EVENTS:work+'/events.jsonl'};
  const row={mode,argv,cwd:root,start:new Date().toISOString(),outerSafetyLimitMs:8000};
  const out=await fs.open(work+'/parent.stdout','wx'),err=await fs.open(work+'/parent.stderr','wx');
  const proc=spawn(argv[0],argv.slice(1),{cwd:root,env,detached:true,stdio:['ignore',out.fd,err.fd]});
  row.parentPID=proc.pid;
  const safety=setTimeout(async()=>{
    row.outerForced=true;row.safetyActions=[];
    try {
      const events=(await fs.readFile(work+'/events.jsonl','utf8')).trim().split('\n').map(JSON.parse);
      for(const x of events.filter(e=>e.event==='start')){
        const now=await stat(x.pid);
        if(now?.startTicks===x.startTicks&&now.pgid===x.pgid){
          try { process.kill(-x.pgid,'SIGKILL');row.safetyActions.push({pgid:x.pgid,sig:'SIGKILL'}); }
          catch(e){row.safetyActions.push({pgid:x.pgid,error:e.code});}
        }
      }
    } finally {try{process.kill(-proc.pid,'SIGKILL');}catch(e){row.safetyActions.push({parent:proc.pid,error:e.code});}}
  },8000);
  Object.assign(row,await new Promise((resolve,reject)=>{proc.on('error',reject);proc.on('close',(rc,signal)=>resolve({rc,signal}));}));
  clearTimeout(safety);row.end=new Date().toISOString();await out.close();await err.close();
  const records=JSON.parse(await fs.readFile(work+'/results.log.json','utf8')).filter(x=>x.name);assert.equal(records.length,1);
  row.record=records[0];row.events=(await fs.readFile(work+'/events.jsonl','utf8')).trim().split('\n').map(JSON.parse);
  const text=row.record.compile_log.replace(/\x1b\[[0-9;]*m/g,''),timed=!['normal','exit127'].includes(mode);
  row.failures=[];const check=(ok,message)=>{if(!ok)row.failures.push(message);};
  check(row.rc===0&&!row.signal&&!row.outerForced,'public harness did not finish without external force');
  check(text.includes('stderr-before-wait')&&text.includes('stdout-before-wait'),'original output was lost');
  check(text.includes('return code: '+(mode==='normal'?'0':'127')),'compatibility code changed');
  check(row.record.result===(mode==='normal'?'PASSED':'ERRORED'),'verdict changed');
  check(timed===text.includes('second timeout has expired'),'timeout classified incorrectly');
  if(timed){
    check(text.includes('timed out: True'),'missing separate timeout flag');
    const wait=Number(text.match(/waited process return code: (-?\d+)/)?.[1]),pid=Number(text.match(/waited process pid: (\d+)/)?.[1]);
    row.wait={pid,returncode:wait};
    check(wait===(mode==='term7'?7:mode==='ignoreterm'?-9:-15),'incorrect direct process wait status');
    check(mode==='descendant'?pid!==row.events[0].pid:pid===row.events[0].pid,'direct shell/exec identity was conflated');
    if(mode==='term7')check(text.includes('stderr-on-term')&&row.events.some(x=>x.event==='TERM'),'post-TERM stderr lost');
    if(['ignoreterm','descendant'].includes(mode)){
      check(row.record.compile_time<2.5,'post-timeout pipe/wait cleanup exceeded bounded allowance');
      check(text.includes('SIGKILL: sent'),'required group SIGKILL was not recorded');
      check(text.includes('stderr-ignored-term')&&row.events.some(x=>x.event==='ignored-TERM'),'TERM-resistant fixture was not reached');
    }
  } else check(!text.includes('timed out: True'),'normal exit was labeled timeout');
  row.remaining=[];
  for(const x of row.events.filter(e=>e.event==='start')){
    let current=await stat(x.pid);
    for(let i=0;current?.startTicks===x.startTicks&&i<20;i++){await new Promise(r=>setTimeout(r,25));current=await stat(x.pid);}
    if(current?.startTicks===x.startTicks)row.remaining.push({pid:x.pid,...current});
  }
  check(row.remaining.length===0,'exact fixture process still exists');
  row.pass=row.failures.length===0;results.push(row);
  await fs.writeFile(root+'/result.json',JSON.stringify({harness,results},null,2)+'\n');
  console.log(JSON.stringify({mode,parentRC:row.rc,parentSignal:row.signal,outerForced:!!row.outerForced,compileSeconds:row.record.compile_time,wait:row.wait,result:row.record.result,pass:row.pass,failures:row.failures}));
}
assert.ok(results.every(x=>x.pass),'public harness timeout evidence controls failed');
