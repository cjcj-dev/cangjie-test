/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            03_01_a01_02

  @Level:         1
  @Assertion:       3.1(1) In the Cangjie programming language, we use names to identify entities such as variables,
                    functions, types, packages and modules. The name must be a valid [Identifier].

  @Description:     Using correct identifiers as names.

  @Mode:            compileonly
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no

*/

import utils.assert.Assert

class `class` {}

main() {
    let a: Int64
    let A: Int64

    let bb: Int64
    let bB: Int64
    let Bb: Int64
    let BB: Int64

    let c_: Int64
    let C_: Int64
    let d9: Int64
    let D0: Int64

    let ee_: Int64
    let ee1: Int64
    let f_F: Int64
    let f__: Int64
    let f_2: Int64
    let g3G: Int64
    let g3_: Int64
    let g44: Int64

    let `h`: Int64
    let `H`: Int64

    let `ii`: Int64
    let `iI`: Int64
    let `Ii`: Int64
    let `II`: Int64

    let `j_`: Int64
    let `J_`: Int64
    let `k5`: Int64
    let `K6`: Int64

    let `ll_`: Int64
    let `ll7`: Int64
    let `m_M`: Int64
    let `m__`: Int64
    let `m_8`: Int64
    let `n9N`: Int64
    let `n0_`: Int64
    let `n11`: Int64

    let `Int64`: Int64
    let `main`: Int64
    let `as`: Int64

    a = 1
    Assert.equals(1, a)
    A = 2
    Assert.equals(2, A)
    bb = 3
    Assert.equals(3, bb)
    bB = 4
    Assert.equals(4, bB)
    Bb = 5
    Assert.equals(5, Bb)
    BB = 6
    Assert.equals(6, BB)
    c_ = 7
    Assert.equals(7, c_)
    C_ = 8
    Assert.equals(8, C_)
    d9 = 9
    Assert.equals(9, d9)
    D0 = 10
    Assert.equals(10, D0)
    ee_ = 11
    Assert.equals(11, ee_)
    ee1 = 12
    Assert.equals(12, ee1)
    f_F = 13
    Assert.equals(13, f_F)
    f__ = 14
    Assert.equals(14, f__)
    f_2 = 15
    Assert.equals(15, f_2)
    g3G = 16
    Assert.equals(16, g3G)
    g3_ = 17
    Assert.equals(17, g3_)
    g44 = 18
    Assert.equals(18, g44)
    `h` = 19
    Assert.equals(19, `h`)
    `H` = 20
    Assert.equals(20, `H`)
    `ii` = 21
    Assert.equals(21, `ii`)
    `iI` = 22
    Assert.equals(22, `iI`)
    `Ii` = 23
    Assert.equals(23, `Ii`)
    `II` = 24
    Assert.equals(24, `II`)
    `j_` = 25
    Assert.equals(25, `j_`)
    `J_` = 26
    Assert.equals(26, `J_`)
    `k5` = 27
    Assert.equals(27, `k5`)
    `K6` = 28
    Assert.equals(28, `K6`)
    `ll_` = 29
    Assert.equals(29, `ll_`)
    `ll7` = 30
    Assert.equals(30, `ll7`)
    `m_M` = 31
    Assert.equals(31, `m_M`)
    `m__` = 32
    Assert.equals(32, `m__`)
    `m_8` = 33
    Assert.equals(33, `m_8`)
    `n9N` = 34
    Assert.equals(34, `n9N`)
    `n0_` = 35
    Assert.equals(35, `n0_`)
    `n11` = 36
    Assert.equals(36, `n11`)
    `Int64` = 37
    Assert.equals(37, `Int64`)
    `main` = 38
    Assert.equals(38, `main`)
    `as` = 39
    Assert.equals(39, `as`)
}
