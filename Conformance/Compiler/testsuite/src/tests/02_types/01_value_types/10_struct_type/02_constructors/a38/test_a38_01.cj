/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 02_01_10_02_a38_01

  @Level:         1

  @Assertion: 2.1.10.2(38)
              If called, it must be at the first expression in the constructor body,
              without any expression or declaration before it.

  @Description: Check that this can be called as long as it's the first
                expression in the constructor

  @Mode: run

  @Negative: no

  @Structure: single

  @Comment: This is the continuation of the previous assertion:
            It is allowed to invoke other constructors via this in a constructor.

*/

import utils.assert.Assert

var gv = 0
var called_const = 0

struct Test {
    private init() {
        called_const = 2
    }

    init(a: Int64) {
        this()
        Assert.equals(1, a)
        let x = 1
        let y = 2

        func f(x: Int64) {
            return x + 1
        }

        let z = f(x + y)
        gv = z
    }

    init(x: String) {
        this()
        Assert.equals(1, [x].size)

        var m = 20

        func g(x: Int64, y: Int64) {
            return x * y
        }

        var h = g(m, m/2)

        gv = h
    }

    init(x: Rune) {
        this()
        Assert.equals(r'w', x)
    }
}

main() {
    let case1 = Test(1)
    Assert.equals(1, [case1].size)
    Assert.equals(4, gv)
    Assert.equals(2, called_const)
    called_const = 0

    let case2 = Test("")
    Assert.equals(1, [case2].size)
    Assert.equals(200, gv)
    Assert.equals(2, called_const)
    called_const = 0

    let case3 = Test('w')
    Assert.equals(1, [case3].size)
    Assert.equals(2, called_const)
    called_const = 0
    Assert.equals(1, [Test(r'w')].size)
    Assert.equals(2, called_const)
}