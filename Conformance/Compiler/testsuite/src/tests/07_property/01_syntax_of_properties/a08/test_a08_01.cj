/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_01_a08_01

  @Level:         1

  @Assertion:   7.1(8) In particular, properties in struct, like fields declared with let,
                cannot be assigned values when an instance of struct is declared using let.

  @Description: Checks that struct with mut property can be declared via let.

  @Mode:        compileonly
  @Negative:    no
  @Structure:   single
  @Issue:       0006124


*/

import utils.assert.Assert

struct Foo {
  mut prop a: Int64 {
    get() {
      0
    } 
    set(v) { Assert.equals(1, [v].size) }
  }
}

main() {
  let x = Foo()
  Assert.equals(0, x.a)
  var writable = Foo()
  writable.a = 1
  Assert.equals(0, writable.a)
  return 0;
}


