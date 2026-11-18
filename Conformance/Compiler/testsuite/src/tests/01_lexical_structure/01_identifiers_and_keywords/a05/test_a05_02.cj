/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_01_a05_02

  @Level:         1

  @Assertion:    1.1(5) A raw identifier is got by adding a pair of backquotes
                 (i.e., `..`) outside of ordinary identifiers or keywords.

  @Description:  Check symbols allowed to present in an identifier.

  @Mode:         compileonly

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

main() {
    var `A0`: Int32 = 48
    var `A1`: Int32 = 49
    var `A2`: Int32 = 50
    var `A3`: Int32 = 51
    var `A4`: Int32 = 52
    var `A5`: Int32 = 53
    var `A6`: Int32 = 54
    var `A7`: Int32 = 55
    var `A8`: Int32 = 56
    var `A9`: Int32 = 57

    var `AA`: Int32 = 65
    var `AB`: Int32 = 66
    var `AC`: Int32 = 67
    var `AD`: Int32 = 68
    var `AE`: Int32 = 69
    var `AF`: Int32 = 70
    var `AG`: Int32 = 71
    var `AH`: Int32 = 72
    var `AI`: Int32 = 73
    var `AJ`: Int32 = 74
    var `AK`: Int32 = 75
    var `AL`: Int32 = 76
    var `AM`: Int32 = 77
    var `AN`: Int32 = 78
    var `AO`: Int32 = 79
    var `AP`: Int32 = 80
    var `AQ`: Int32 = 81
    var `AR`: Int32 = 82
    var `AS`: Int32 = 83
    var `AT`: Int32 = 84
    var `AU`: Int32 = 85
    var `AV`: Int32 = 86
    var `AW`: Int32 = 87
    var `AX`: Int32 = 88
    var `AY`: Int32 = 89
    var `AZ`: Int32 = 90

    var `A_`: Int32 = 95

    var `Aa`: Int32 = 97
    var `Ab`: Int32 = 98
    var `Ac`: Int32 = 99
    var `Ad`: Int32 = 100
    var `Ae`: Int32 = 101
    var `Af`: Int32 = 102
    var `Ag`: Int32 = 103
    var `Ah`: Int32 = 104
    var `Ai`: Int32 = 105
    var `Aj`: Int32 = 106
    var `Ak`: Int32 = 107
    var `Al`: Int32 = 108
    var `Am`: Int32 = 109
    var `An`: Int32 = 110
    var `Ao`: Int32 = 111
    var `Ap`: Int32 = 112
    var `Aq`: Int32 = 113
    var `Ar`: Int32 = 114
    var `As`: Int32 = 115
    var `At`: Int32 = 116
    var `Au`: Int32 = 117
    var `Av`: Int32 = 118
    var `Aw`: Int32 = 119
    var `Ax`: Int32 = 120
    var `Ay`: Int32 = 121
    var `Az`: Int32 = 122

    let `a0` = 0
    let `a1` = 0
    let `a2` = 0
    let `a3` = 0
    let `a4` = 0
    let `a5` = 0
    let `a6` = 0
    let `a7` = 0
    let `a8` = 0
    let `a9` = 0

    let `aA` = 0
    let `aB` = 0
    let `aC` = 0
    let `aD` = 0
    let `aE` = 0
    let `aF` = 0
    let `aG` = 0
    let `aH` = 0
    let `aI` = 0
    let `aJ` = 0
    let `aK` = 0
    let `aL` = 0
    let `aM` = 0
    let `aN` = 0
    let `aO` = 0
    let `aP` = 0
    let `aQ` = 0
    let `aR` = 0
    let `aS` = 0
    let `aT` = 0
    let `aU` = 0
    let `aV` = 0
    let `aW` = 0
    let `aX` = 0
    let `aY` = 0
    let `aZ` = 0

    let `a_` = 0

    let `aa` = 0
    let `ab` = 0
    let `ac` = 0
    let `ad` = 0
    let `ae` = 0
    let `af` = 0
    let `ag` = 0
    let `ah` = 0
    let `ai` = 0
    let `aj` = 0
    let `ak` = 0
    let `al` = 0
    let `am` = 0
    let `an` = 0
    let `ao` = 0
    let `ap` = 0
    let `aq` = 0
    let `ar` = 0
    let `as` = 0
    let `at` = 0
    let `au` = 0
    let `av` = 0
    let `aw` = 0
    let `ax` = 0
    let `ay` = 0
    let `az` = 0

    Assert.equals(48, `A0`)
    Assert.equals(49, `A1`)
    Assert.equals(50, `A2`)
    Assert.equals(51, `A3`)
    Assert.equals(52, `A4`)
    Assert.equals(53, `A5`)
    Assert.equals(54, `A6`)
    Assert.equals(55, `A7`)
    Assert.equals(56, `A8`)
    Assert.equals(57, `A9`)
    Assert.equals(65, `AA`)
    Assert.equals(66, `AB`)
    Assert.equals(67, `AC`)
    Assert.equals(68, `AD`)
    Assert.equals(69, `AE`)
    Assert.equals(70, `AF`)
    Assert.equals(71, `AG`)
    Assert.equals(72, `AH`)
    Assert.equals(73, `AI`)
    Assert.equals(74, `AJ`)
    Assert.equals(75, `AK`)
    Assert.equals(76, `AL`)
    Assert.equals(77, `AM`)
    Assert.equals(78, `AN`)
    Assert.equals(79, `AO`)
    Assert.equals(80, `AP`)
    Assert.equals(81, `AQ`)
    Assert.equals(82, `AR`)
    Assert.equals(83, `AS`)
    Assert.equals(84, `AT`)
    Assert.equals(85, `AU`)
    Assert.equals(86, `AV`)
    Assert.equals(87, `AW`)
    Assert.equals(88, `AX`)
    Assert.equals(89, `AY`)
    Assert.equals(90, `AZ`)
    Assert.equals(95, `A_`)
    Assert.equals(97, `Aa`)
    Assert.equals(98, `Ab`)
    Assert.equals(99, `Ac`)
    Assert.equals(100, `Ad`)
    Assert.equals(101, `Ae`)
    Assert.equals(102, `Af`)
    Assert.equals(103, `Ag`)
    Assert.equals(104, `Ah`)
    Assert.equals(105, `Ai`)
    Assert.equals(106, `Aj`)
    Assert.equals(107, `Ak`)
    Assert.equals(108, `Al`)
    Assert.equals(109, `Am`)
    Assert.equals(110, `An`)
    Assert.equals(111, `Ao`)
    Assert.equals(112, `Ap`)
    Assert.equals(113, `Aq`)
    Assert.equals(114, `Ar`)
    Assert.equals(115, `As`)
    Assert.equals(116, `At`)
    Assert.equals(117, `Au`)
    Assert.equals(118, `Av`)
    Assert.equals(119, `Aw`)
    Assert.equals(120, `Ax`)
    Assert.equals(121, `Ay`)
    Assert.equals(122, `Az`)
    Assert.equals(0, `a0`)
    Assert.equals(0, `a1`)
    Assert.equals(0, `a2`)
    Assert.equals(0, `a3`)
    Assert.equals(0, `a4`)
    Assert.equals(0, `a5`)
    Assert.equals(0, `a6`)
    Assert.equals(0, `a7`)
    Assert.equals(0, `a8`)
    Assert.equals(0, `a9`)
    Assert.equals(0, `aA`)
    Assert.equals(0, `aB`)
    Assert.equals(0, `aC`)
    Assert.equals(0, `aD`)
    Assert.equals(0, `aE`)
    Assert.equals(0, `aF`)
    Assert.equals(0, `aG`)
    Assert.equals(0, `aH`)
    Assert.equals(0, `aI`)
    Assert.equals(0, `aJ`)
    Assert.equals(0, `aK`)
    Assert.equals(0, `aL`)
    Assert.equals(0, `aM`)
    Assert.equals(0, `aN`)
    Assert.equals(0, `aO`)
    Assert.equals(0, `aP`)
    Assert.equals(0, `aQ`)
    Assert.equals(0, `aR`)
    Assert.equals(0, `aS`)
    Assert.equals(0, `aT`)
    Assert.equals(0, `aU`)
    Assert.equals(0, `aV`)
    Assert.equals(0, `aW`)
    Assert.equals(0, `aX`)
    Assert.equals(0, `aY`)
    Assert.equals(0, `aZ`)
    Assert.equals(0, `a_`)
    Assert.equals(0, `aa`)
    Assert.equals(0, `ab`)
    Assert.equals(0, `ac`)
    Assert.equals(0, `ad`)
    Assert.equals(0, `ae`)
    Assert.equals(0, `af`)
    Assert.equals(0, `ag`)
    Assert.equals(0, `ah`)
    Assert.equals(0, `ai`)
    Assert.equals(0, `aj`)
    Assert.equals(0, `ak`)
    Assert.equals(0, `al`)
    Assert.equals(0, `am`)
    Assert.equals(0, `an`)
    Assert.equals(0, `ao`)
    Assert.equals(0, `ap`)
    Assert.equals(0, `aq`)
    Assert.equals(0, `ar`)
    Assert.equals(0, `as`)
    Assert.equals(0, `at`)
    Assert.equals(0, `au`)
    Assert.equals(0, `av`)
    Assert.equals(0, `aw`)
    Assert.equals(0, `ax`)
    Assert.equals(0, `ay`)
    Assert.equals(0, `az`)
}
