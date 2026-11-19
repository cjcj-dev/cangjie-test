/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_a02_01

  @Level:         1

  @Assertion: 6.1.2(2)
              Members of a class can be classified into static members and 
              instance members based on whether they are modified by static.

  @Description: Check that a class can contain static members
                that are modified by the static modifier and
                instance members that are not modified by
                the static modifier

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006124

*/

import utils.assert.Assert

let setterSeen = [false, false]

class Test {
  // Static members
  // - Variables
  static var smv = 1
  static let siv = 2

  // - Functions
  static func sf(s: String) {
    Assert.equals("1", s)
    return 3
  }

  // - Properties
  static mut prop smp: Int64 {
    get() {
      4
    }
    set(v) { Assert.equals(44, v); setterSeen[0] = true }
  }

  static prop sip: Int64 {
    get() {
      5
    }
  }

  // Instance members
  // - Variables
  var imv = 6
  let iiv = 7

  // - Functions
  func `if`(x: Bool) {
    Assert.isFalse(x)
    return 8
  }

  // - Properties
  mut prop imp: Int64 {
    get() {
      9
    }
    set(v) { Assert.equals(99, v); setterSeen[1] = true }
  }

  prop iip: Int64 {
    get() {
      10
    }
  }
}

main() {
  Assert.equals(1, Test.smv)
  Assert.equals(2, Test.siv)
  Assert.equals(3, Test.sf("1"))
  Assert.equals(4, Test.smp)
  Test.smp = 44
  Assert.equals(5, Test.sip)

  let tst = Test()

  Assert.equals(6, tst.imv)
  Assert.equals(7, tst.iiv)
  Assert.equals(8, tst.`if`(false))
  Assert.equals(9, tst.imp)
  tst.imp = 99
  Assert.equals(10, tst.iip)
    Assert.equals([true, true], setterSeen)
}
