/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_02_a08_02

  @Level:         1

  @Assertion: 6.1.1.2(8)
              All classes except class Object have a super class.

  @Description: Check that some standard classes have a superclass

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert
import std.ast.Tokens
import std.collection.HashMap
import std.io.ByteBuffer

// Since Object is a class, all types except Object that are able to instantiate this class have a superclass
class SuperTester<T> where T <: Object {}

main() {
  var box = SuperTester<Box<Any>>()
  let constructedValue0 = [box]; Assert.equals(1, constructedValue0.size);
  Assert.isTrue(box is SuperTester<Box<Any>>)

  var stack_overflow = SuperTester<StackOverflowError>()
  let constructedValue1 = [stack_overflow]; Assert.equals(1, constructedValue1.size);
  Assert.isTrue(stack_overflow is SuperTester<StackOverflowError>)

  var oom = SuperTester<OutOfMemoryError>()
  let constructedValue2 = [oom]; Assert.equals(1, constructedValue2.size);
  Assert.isTrue(oom is SuperTester<OutOfMemoryError>)

  var array_iterator = SuperTester<ArrayIterator<Int32>>()
  let constructedValue3 = [array_iterator]; Assert.equals(1, constructedValue3.size);
  Assert.isTrue(array_iterator is SuperTester<ArrayIterator<Int32>>)

  var error = SuperTester<Error>()
  let constructedValue4 = [error]; Assert.equals(1, constructedValue4.size);
  Assert.isTrue(error is SuperTester<Error>)

  var exception = SuperTester<Exception>()
  let constructedValue5 = [exception]; Assert.equals(1, constructedValue5.size);
  Assert.isTrue(exception is SuperTester<Exception>)

  var future = SuperTester<Future<Rune>>()
  let constructedValue6 = [future]; Assert.equals(1, constructedValue6.size);
  Assert.isTrue(future is SuperTester<Future<Rune>>)

  var range_iterator = SuperTester<RangeIterator<Int32>>()
  let constructedValue7 = [range_iterator]; Assert.equals(1, constructedValue7.size);
  Assert.isTrue(range_iterator is SuperTester<RangeIterator<Int32>>)

  var ste = SuperTester<StackTraceElement>()
  let constructedValue8 = [ste]; Assert.equals(1, constructedValue8.size);
  Assert.isTrue(ste is SuperTester<StackTraceElement>)

  var tokens = SuperTester<Tokens>()
  let constructedValue9 = [tokens]; Assert.equals(1, constructedValue9.size);
  Assert.isTrue(tokens is SuperTester<Tokens>)

  var hash_map = SuperTester<HashMap<Int32, Int32>>()
  let constructedValue10 = [hash_map]; Assert.equals(1, constructedValue10.size);
  Assert.isTrue(hash_map is SuperTester<HashMap<Int32, Int32>>)

  var ba_stream = SuperTester<ByteBuffer>()
  let constructedValue11 = [ba_stream]; Assert.equals(1, constructedValue11.size);
  Assert.isTrue(ba_stream is SuperTester<ByteBuffer>)

}
