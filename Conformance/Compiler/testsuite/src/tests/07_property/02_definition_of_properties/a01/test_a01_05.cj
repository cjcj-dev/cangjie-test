/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_02_a01_05

  @Level:         1

  @Assertion:   7.2(1) Properties can be defined in interface, class, struct, enum, extend

  @Description: Checks that property can be defined in extent.

  @Mode:        compileonly
  @Negative:    no
  @Structure:   single
  @Issue:       0006124


*/

import utils.assert.Assert

class A {
}

struct B {
}

extend A {
  prop a1 : Int32 {
    get() { 0 }
  }
  mut prop a2 : Int32 {
    get() { 0 }
    set(v) { Assert.equals(1, [v].size) }
  }
}

extend B {
  prop b1 : Int32 {
    get() { 0 }
  }
  mut prop b2 : Int32 {
    get() { 0 }
    set(v) { Assert.equals(1, [v].size) }
  }
}

extend Int32 {
  prop a1 : Int32 {
    get() { 0 }
  }
}

main() {
    var a = A()
    Assert.equals(0, a.a1)
    a.a2 = 1
    Assert.equals(0, a.a2)
    var b = B()
    Assert.equals(0, b.b1)
    b.b2 = 1
    Assert.equals(0, b.b2)
    let original: Int32 = 3
    Assert.equals(0, original.a1)
    return 0;
}


