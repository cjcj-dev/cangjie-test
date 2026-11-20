/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_03_a06_01

  @Level:         1

  @Assertion:   7.3(6) The behavior of accessing properties is consistent whether inside or
                outside the property, so recursive access to properties can cause the same
                dead loops as functions.

  @Description: Checks that property getter with dead loop gives StackOverflowError at runtime.

  @Mode:        CompileOnly
  @Negative:    no
  @Structure:   single
  @Issue:       0006124


*/

import utils.assert.Assert

class A {
  mut prop aProp: Int64 {
    get() {
      aProp
    }
    set(v) { let _ = v }
  } 
}


main() {
  var x = A()
  x.aProp = 1
  try {
    let value = x.aProp
    Assert.fail(reason: "Recursive getter returned ${value}; expected StackOverflowError")
  } catch (_: StackOverflowError) {
    println("caught StackOverflowError from x.aProp")
  }
  return 0
}
