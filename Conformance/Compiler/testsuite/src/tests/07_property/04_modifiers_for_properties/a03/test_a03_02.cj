/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_04_a03_02

  @Level:         1

  @Assertion:   7.4(3) Properties can use the access control modifiers private, protected and public.

  @Description: Checks that property can use the access control modifiers.

  @Mode:        compileonly
  @Negative:    no
  @Structure:   single
  @Issue:       0006124


*/

import utils.assert.Assert

struct A {
  mut prop a: Int64 {
    get() { 0 }
    set(v) { Assert.equals(1, [v].size) }
  }
  private mut prop b: Int64 {
    get() { 0 }
    set(v) { Assert.equals(1, [v].size) }
  }
  public mut prop d: Int64 {
    get() { 0 }
    set(v) { Assert.equals(1, [v].size) }
  }
  mut func checkAccess() {
    a = 1
    Assert.equals(0, a)
    b = 1
    Assert.equals(0, b)
    d = 1
    Assert.equals(0, d)
  }
}

main() {
  var x = A()
  x.checkAccess()
  return 0;
}


