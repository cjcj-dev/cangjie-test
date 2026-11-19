/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_04_a01_01

  @Level:         1

  @Assertion:   7.4(1) Properties, like functions, can be modified with modifiers, but only
                for the entire property, not for the getter or setter independently.

  @Description: Checks that properties can be modified with modifiers.

  @Mode:        run
  @Negative:    no
  @Structure:   single
  @Issue:       0006124


*/

import utils.assert.Assert

class A1 {
  public mut prop a1 : UInt8 {
    get() { 0 }
    set(v) { Assert.equals(1, [v].size) }
  }
  static mut prop a2 : UInt16 {
    get() { 0 }
    set(v) { Assert.equals(1, [v].size) }
  }
  private mut prop a3 : UInt32 {
    get() { 0 }
    set(v) { Assert.equals(1, [v].size) }
  }
  protected mut prop a4 : UInt64 {
    get() { 0 }
    set(v) { Assert.equals(1, [v].size) }
  }
  func checkHiddenProperties() {
    a3 = 3
    Assert.equals(0, a3)
    a4 = 4
    Assert.equals(0, a4)
  }
}

main() {
  var x = A1()
  x.a1 = 1
  Assert.equals(0, x.a1)
  A1.a2 = 2
  Assert.equals(0, A1.a2)
  x.checkHiddenProperties()
  return 0;
}


