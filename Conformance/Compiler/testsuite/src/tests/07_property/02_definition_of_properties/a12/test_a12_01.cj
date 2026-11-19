/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_02_a12_01

  @Level:         1

  @Assertion:   7.2(12)
                class A {
                  var x = 0
                  mut prop X: Int64 {
                    get() {
                      x+y
                    }
                    set(v) {
                      x=v+y
                    }
                  }
                  static var y = 0
                  static mut prop Y: Int64 {
                    get() {
                      y
                    }
                    set(v) {
                      y=v
                    }
                  }
                }

  @Description: Checks that example is compiled without errors.

  @Mode:        compileonly
  @Negative:    no
  @Structure:   single
  @Issue:       0006124


*/

import utils.assert.Assert

class A {
  var x = 0
  mut prop X: Int64 {
    get() {
      x+y
    }
    set(v) {
      x=v+y
    }
  }
  static var y = 0
  static mut prop Y: Int64 {
    get() {
      y
    }
    set(v) {
      y=v
    }
  }
}

main() {
  let example = A()
  A.Y = 2
  Assert.equals(2, A.Y)
  example.X = 3
  Assert.equals(7, example.X)
  return 0;
}


