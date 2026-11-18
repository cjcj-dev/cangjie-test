/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_01_a05_01

  @Level:         1

  @Assertion:    1.1(5) A raw identifier is got by adding a pair of backquotes
                 (i.e., `..`) outside of ordinary identifiers or keywords.

  @Description:  Check symbols allowed to start an identifier.

  @Mode:         compileonly

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

main() {
    var `A`: Int32 = 65
    var `B`: Int32 = 66
    var `C`: Int32 = 67
    var `D`: Int32 = 68
    var `E`: Int32 = 69
    var `F`: Int32 = 70
    var `G`: Int32 = 71
    var `H`: Int32 = 72
    var `I`: Int32 = 73
    var `J`: Int32 = 74
    var `K`: Int32 = 75
    var `L`: Int32 = 76
    var `M`: Int32 = 77
    var `N`: Int32 = 78
    var `O`: Int32 = 79
    var `P`: Int32 = 80
    var `Q`: Int32 = 81
    var `R`: Int32 = 82
    var `S`: Int32 = 83
    var `T`: Int32 = 84
    var `U`: Int32 = 85
    var `V`: Int32 = 86
    var `W`: Int32 = 87
    var `X`: Int32 = 88
    var `Y`: Int32 = 89
    var `Z`: Int32 = 90

    var `a`: Int32 = 97
    var `b`: Int32 = 98
    var `c`: Int32 = 99
    var `d`: Int32 = 100
    var `e`: Int32 = 101
    var `f`: Int32 = 102
    var `g`: Int32 = 103
    var `h`: Int32 = 104
    var `i`: Int32 = 105
    var `j`: Int32 = 106
    var `k`: Int32 = 107
    var `l`: Int32 = 108
    var `m`: Int32 = 109
    var `n`: Int32 = 110
    var `o`: Int32 = 111
    var `p`: Int32 = 112
    var `q`: Int32 = 113
    var `r`: Int32 = 114
    var `s`: Int32 = 115
    var `t`: Int32 = 116
    var `u`: Int32 = 117
    var `v`: Int32 = 118
    var `w`: Int32 = 119
    var `x`: Int32 = 120
    var `y`: Int32 = 121
    var `z`: Int32 = 122

    Assert.equals(65, `A`)
    Assert.equals(66, `B`)
    Assert.equals(67, `C`)
    Assert.equals(68, `D`)
    Assert.equals(69, `E`)
    Assert.equals(70, `F`)
    Assert.equals(71, `G`)
    Assert.equals(72, `H`)
    Assert.equals(73, `I`)
    Assert.equals(74, `J`)
    Assert.equals(75, `K`)
    Assert.equals(76, `L`)
    Assert.equals(77, `M`)
    Assert.equals(78, `N`)
    Assert.equals(79, `O`)
    Assert.equals(80, `P`)
    Assert.equals(81, `Q`)
    Assert.equals(82, `R`)
    Assert.equals(83, `S`)
    Assert.equals(84, `T`)
    Assert.equals(85, `U`)
    Assert.equals(86, `V`)
    Assert.equals(87, `W`)
    Assert.equals(88, `X`)
    Assert.equals(89, `Y`)
    Assert.equals(90, `Z`)
    Assert.equals(97, `a`)
    Assert.equals(98, `b`)
    Assert.equals(99, `c`)
    Assert.equals(100, `d`)
    Assert.equals(101, `e`)
    Assert.equals(102, `f`)
    Assert.equals(103, `g`)
    Assert.equals(104, `h`)
    Assert.equals(105, `i`)
    Assert.equals(106, `j`)
    Assert.equals(107, `k`)
    Assert.equals(108, `l`)
    Assert.equals(109, `m`)
    Assert.equals(110, `n`)
    Assert.equals(111, `o`)
    Assert.equals(112, `p`)
    Assert.equals(113, `q`)
    Assert.equals(114, `r`)
    Assert.equals(115, `s`)
    Assert.equals(116, `t`)
    Assert.equals(117, `u`)
    Assert.equals(118, `v`)
    Assert.equals(119, `w`)
    Assert.equals(120, `x`)
    Assert.equals(121, `y`)
    Assert.equals(122, `z`)
}
