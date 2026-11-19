/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_02_a01_02

  @Level:         1

  @Assertion: 4.2(1) The variable name and the function name themselves
              (including variables or functions referred to by package
              names) are also expressions.
  @Description: Checks that function names are expressions.
  @Mode: run
  @Negative: no
  @Structure: single

*/

import utils.assert.Assert

func empty() {}

func with_params(i: Int64, j: Int32, name: String) {
    Assert.equals(7, i)
    Assert.equals(3i32, j)
    Assert.equals("argument", name)
}

func with_return(): Int64 {
    Assert.getRuntimeZero()
}

func generic<T>(): Int64 {
    1
}

func complex<T1, T2, T3>(a: T1, b: T2, c: T3): T3 {
    (a, b, c)[2]
}

main() {
    func internal_empty() {}

    func internal_with_params(i: Int64, j: Int32, name: String) {
        Assert.equals(7, i)
        Assert.equals(3i32, j)
        Assert.equals("argument", name)
    }

    func internal_with_return(): Int64 {
        -1
    }

    func internal_generic<T>() {}

    func internal_complex<T1, T2, T3>(a: T1, b: T2, c: T3): T3 {
        (a, b, c)[2]
    }

    let f1 = empty
    let f2 = with_params
    let f3 = with_return
    let f4 = generic<Int32>
    let f5 = complex<Int32, Int64, String>
    Assert.equals((), f1())
    Assert.equals((), f2(7, 3i32, "argument"))
    Assert.equals(0, f3())
    Assert.equals(1, f4())
    Assert.equals("result", f5(7i32, 3, "result"))

    let g1 = internal_empty
    let g2 = internal_with_params
    let g3 = internal_with_return
    let g4 = internal_generic<Int32>
    let g5 = internal_complex<Int32, Int64, String>
    Assert.equals((), g1())
    Assert.equals((), g2(7, 3i32, "argument"))
    Assert.equals(-1, g3())
    Assert.equals((), g4())
    Assert.equals("result", g5(7i32, 3, "result"))

    return
}
