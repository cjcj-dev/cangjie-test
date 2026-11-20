#!/usr/bin/env zx
// Check the def-use chain, allowing either a void initializer or a receiver-returning one.
import fs from 'node:fs';
import assert from 'node:assert/strict';

const mode = process.argv[2];
const useMatchers = {
  argument: /^@_CN7default3fooHCNat6FutureIlEl$/,
  cancel: /->@_CNat6FutureIG_E6cancelHv$/,
  escapes: /->@_CNac9ArrayListICNat6FutureIlEE3addHY2_$/,
  thread: /->@_CNat6FutureIG_E6threadpgHv$/,
  tryGet: /->@_CNat6FutureIG_E6tryGetHv$/,
  trySpawn: /->@_CNat6FutureIG_E3getHv$/,
};
assert(Object.hasOwn(useMatchers, mode), 'expected a retained-Future case');
const isTry = mode === 'trySpawn';
const input = fs.readFileSync(0, 'utf8');
assert.match(input, /Func @_CN7default6<main>Hv\(/, 'main CHIR is missing');
assert(!input.includes('executeClosure:'), 'retained Future was folded to executeClosure');

const futureType = 'Class-_CNat6FutureIG_E<Int64>&';
const instructions = [];
const predecessors = new Map();
let block;
const parents = [];
for (const line of input.split('\n')) {
  if (/^\s*\{ Block Group:/.test(line)) {
    parents.push(block);
    block = undefined;
    continue;
  }
  if (/^\s*\}$/.test(line)) {
    block = parents.pop();
    continue;
  }
  const header = /^\s*Block (#\d+):(?:\s*\/\/ predecessors: \[([^\]]*)\])?/.exec(line);
  if (header) {
    block = header[1];
    predecessors.set(block, (header[2] ?? '').match(/#\d+/g) ?? []);
    continue;
  }
  const instruction = /^\s*(?:\[[^\]]+\] )*(?:(%\d+)(?:\[[^\]]*\])?: (.+?) = )?(\w+)(?:\[[^\]]+\])?\((.*)\)(?:: Int64)?(?: \/\/.*)?$/.exec(line);
  if (instruction) {
    const [, id, type, op, operands] = instruction;
    instructions.push({id, type, op, args: operands.split(', '), block});
  }
}
function unique(description, predicate) {
  const matches = instructions.filter(predicate);
  assert.equal(matches.length, 1, description);
  return matches[0];
}
function before(a, b) {
  assert(instructions.indexOf(a) < instructions.indexOf(b), `${a.op} must precede ${b.op}`);
}

const closure = unique('expected the Int64 spawn closure', i => i.op === 'Lambda' && i.type === '() -> Int64');
const allocation = unique('expected one retained Future allocation', i =>
  i.type === futureType && i.op === (isTry ? 'TryAllocate' : 'Allocate'));
const apply = isTry ? 'TryApply' : 'Apply';
const initializer = unique('expected one retained Future initializer', i =>
  i.op === apply && /->@_CNat6FutureIG_E6<init>HF0G_E$/.test(i.args[0]));
assert.deepEqual(initializer.args.slice(1, 3), [allocation.id, closure.id],
  'initializer must consume the allocated Future and the spawn closure');
assert(initializer.type === 'Void' || initializer.type === futureType, 'unexpected initializer result type');
const receiver = initializer.type === 'Void' ? allocation.id : initializer.id;
assert(receiver, 'initialized Future has no value');
const spawn = unique('expected the retained spawn operation', i => i.op === (isTry ? 'TrySpawn' : 'Spawn'));
assert.equal(spawn.type, futureType, 'spawn must retain a Future result');
assert.equal(spawn.args[0], receiver, 'spawn must consume the initialized Future');
before(closure, initializer);
before(allocation, initializer);
before(initializer, spawn);

const use = unique(`expected the retained ${mode} operation`, i => i.op === apply && useMatchers[mode].test(i.args[0]));
assert.equal(use.args[mode === 'escapes' ? 2 : 1], receiver, `${mode} must consume the initialized Future`);
before(spawn, use);
if (mode === 'argument') {
  assert(!input.includes('@_CNat6FutureIG_E3getHv'), 'only the surviving argument escape should block the fold');
}
if (['cancel', 'thread', 'tryGet', 'trySpawn'].includes(mode)) {
  const debug = unique('expected the f debug binding', i => i.op === 'Debug' && i.args[1] === 'f');
  assert.equal(debug.args[0], receiver, 'debug must still name the initialized Future');
  before(spawn, debug);
  before(debug, use);
}
if (mode === 'thread') {
  const id = unique('expected Thread.id access', i => i.op === 'Apply' && /->@_CNat6Thread2idpgHv$/.test(i.args[0]));
  assert.equal(id.args[1], use.id, 'read the id of the thread obtained from this Future');
}
if (isTry) {
  const target = (args, label) => args.find(a => a.startsWith(label + ': '))?.split(': ')[1];
  const normal = target(spawn.args, 'normal');
  const exception = target(spawn.args, 'exception');
  assert(normal && exception && normal !== exception, 'TrySpawn must have distinct normal and exception edges');
  assert.equal(normal, use.block, 'get must run on the spawn success edge');
  const resultStore = unique('get result must flow to the return slot', i => i.op === 'Store' && i.args[0] === use.id);
  const catchEntry = unique('expected catch entry', i => i.op === 'GetException');
  assert.equal(exception, catchEntry.block, 'TrySpawn must keep the catch edge');

  function checkEdges(instruction, success, failure) {
    const successors = [...predecessors].filter(([, preds]) => preds.includes(instruction.block)).map(([id]) => id);
    assert.deepEqual(successors.sort(), [success, failure].sort(), `${instruction.op} must keep both CFG edges`);
    // The receiver-returning dump omits TryApply's target text. Verify it too when printed.
    if (instruction.args.some(a => /^(normal|exception): /.test(a))) {
      assert.equal(target(instruction.args, 'normal'), success, 'wrong normal edge');
      assert.equal(target(instruction.args, 'exception'), failure, 'wrong exception edge');
    }
  }
  checkEdges(allocation, initializer.block, exception);
  checkEdges(initializer, spawn.block, exception);
  checkEdges(spawn, use.block, exception);
  checkEdges(use, resultStore.block, exception);
}
console.log(`retained Future: ${mode} (allocate ${allocation.id}, initialize ${receiver}, spawn ${spawn.id})`);
