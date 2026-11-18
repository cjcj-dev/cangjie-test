/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_01_a05_04

  @Level:         1

  @Assertion:    1.1(5) A raw identifier is got by adding a pair of backquotes
                 (i.e., `..`) outside of ordinary identifiers or keywords.

  @Description:  Check that keywords are allowed as raw identifiers.

  @Mode:         compileonly

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

main() {
    var `as`: Int32 = 1
    var `break`: Int32 = 2
    var `Bool`: Int32 = 3
    var `case`: Int32 = 4
    var `catch`: Int32 = 5
    var `class`: Int32 = 6
    var `continue`: Int32 = 7
    var `Rune`: Int32 = 8
    var `do`: Int32 = 9
    var `else`: Int32 = 10
    var `enum`: Int32 = 11
    var `extend`: Int32 = 12
    var `false`: Int32 = 13
    var `finally`: Int32 = 14
    var `for`: Int32 = 15
    var `foreign`: Int32 = 16
    var `from`: Int32 = 17
    var `func`: Int32 = 18
    var `Float16`: Int32 = 19
    var `Float32`: Int32 = 20
    var `Float64`: Int32 = 21
    var `if`: Int32 = 22
    var `import`: Int32 = 23
    var `in`: Int32 = 24
    var `init`: Int32 = 25
    var `inout`: Int32 = 250
    var `interface`: Int32 = 26
    var `is`: Int32 = 27
    var `Int8`: Int32 = 28
    var `Int16`: Int32 = 29
    var `Int32`: Int32 = 30
    var `Int64`: Int32 = 31
    var `IntNative`: Int32 = 32
    var `let`: Int32 = 33
    var `macro`: Int32 = 34
    var `match`: Int32 = 35
    var `mut`: Int32 = 36
    var `main`: Int32 = 37
    var `Nothing`: Int32 = 38
    var `operator`: Int32 = 39
    var `package`: Int32 = 40
    var `prop`: Int32 = 41
    var `quote`: Int32 = 42
    var `return`: Int32 = 43
    var `spawn`: Int32 = 44
    var `struct`: Int32 = 45
    var `static`: Int32 = 46
    var `super`: Int32 = 47
    var `synchronized`: Int32 = 48
    var `this`: Int32 = 49
    var `throw`: Int32 = 50
    var `true`: Int32 = 51
    var `try`: Int32 = 52
    var `type`: Int32 = 53
    var `This`: Int32 = 54
    var `unsafe`: Int32 = 55
    var `UInt8`: Int32 = 56
    var `UInt16`: Int32 = 57
    var `UInt32`: Int32 = 58
    var `UInt64`: Int32 = 59
    var `UIntNative`: Int32 = 60
    var `Unit`: Int32 = 61
    var `var`: Int32 = 62
    var `where`: Int32 = 63
    var `while`: Int32 = 64

    let `abstract` = 0
    let `get` = 0
    let `open` = 0
    let `override` = 0
    let `private` = 0
    let `protected` = 0
    let `public` = 0
    let `redef` = 0
    let `sealed` = 0
    let `set` = 0

    Assert.equals(1, `as`)
    Assert.equals(2, `break`)
    Assert.equals(3, `Bool`)
    Assert.equals(4, `case`)
    Assert.equals(5, `catch`)
    Assert.equals(6, `class`)
    Assert.equals(7, `continue`)
    Assert.equals(8, `Rune`)
    Assert.equals(9, `do`)
    Assert.equals(10, `else`)
    Assert.equals(11, `enum`)
    Assert.equals(12, `extend`)
    Assert.equals(13, `false`)
    Assert.equals(14, `finally`)
    Assert.equals(15, `for`)
    Assert.equals(16, `foreign`)
    Assert.equals(17, `from`)
    Assert.equals(18, `func`)
    Assert.equals(19, `Float16`)
    Assert.equals(20, `Float32`)
    Assert.equals(21, `Float64`)
    Assert.equals(22, `if`)
    Assert.equals(23, `import`)
    Assert.equals(24, `in`)
    Assert.equals(25, `init`)
    Assert.equals(250, `inout`)
    Assert.equals(26, `interface`)
    Assert.equals(27, `is`)
    Assert.equals(28, `Int8`)
    Assert.equals(29, `Int16`)
    Assert.equals(30, `Int32`)
    Assert.equals(31, `Int64`)
    Assert.equals(32, `IntNative`)
    Assert.equals(33, `let`)
    Assert.equals(34, `macro`)
    Assert.equals(35, `match`)
    Assert.equals(36, `mut`)
    Assert.equals(37, `main`)
    Assert.equals(38, `Nothing`)
    Assert.equals(39, `operator`)
    Assert.equals(40, `package`)
    Assert.equals(41, `prop`)
    Assert.equals(42, `quote`)
    Assert.equals(43, `return`)
    Assert.equals(44, `spawn`)
    Assert.equals(45, `struct`)
    Assert.equals(46, `static`)
    Assert.equals(47, `super`)
    Assert.equals(48, `synchronized`)
    Assert.equals(49, `this`)
    Assert.equals(50, `throw`)
    Assert.equals(51, `true`)
    Assert.equals(52, `try`)
    Assert.equals(53, `type`)
    Assert.equals(54, `This`)
    Assert.equals(55, `unsafe`)
    Assert.equals(56, `UInt8`)
    Assert.equals(57, `UInt16`)
    Assert.equals(58, `UInt32`)
    Assert.equals(59, `UInt64`)
    Assert.equals(60, `UIntNative`)
    Assert.equals(61, `Unit`)
    Assert.equals(62, `var`)
    Assert.equals(63, `where`)
    Assert.equals(64, `while`)
    Assert.equals(0, `abstract`)
    Assert.equals(0, `get`)
    Assert.equals(0, `open`)
    Assert.equals(0, `override`)
    Assert.equals(0, `private`)
    Assert.equals(0, `protected`)
    Assert.equals(0, `public`)
    Assert.equals(0, `redef`)
    Assert.equals(0, `sealed`)
    Assert.equals(0, `set`)
}
