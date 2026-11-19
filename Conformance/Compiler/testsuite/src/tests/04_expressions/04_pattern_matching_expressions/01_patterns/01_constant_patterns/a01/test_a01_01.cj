/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_01_a01_01

  @Level:         1

  @Assertion: 4.4.1.1(1) Constant patterns can be integer literals, character byte literals, floating point literals,
              character literals, boolean literals, string literals (string interpolation is not supported),
              Unit literals.

  @Description: Checks match expressions with integer literals constant patterns.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

main() {
    let l1: Int8 = 127
    var m = {value: Int8 => match (value) {
        case 127 => 1
        case _ => 2
    } }(l1)
    Assert.equals(1, m)

    let l2: Int16 = 32767
    m = {value: Int16 => match (value) {
        case 32767 => 1
        case _ => 2
    } }(l2)
    Assert.equals(1, m)

    let l3: Int32 = 2147483647
    m = {value: Int32 => match (value) {
        case 2147483647 => 1
        case _ => 2
    } }(l3)
    Assert.equals(1, m)

    let l4: Int64 = 9223372036854775807
    m = {value: Int64 => match (value) {
        case 9223372036854775807 => 1
        case _ => 2
    } }(l4)
    Assert.equals(1, m)

    let l5: IntNative = 0
    m = {value: IntNative => match (value) {
        case 0 => 1
        case _ => 2
    } }(l5)
    Assert.equals(1, m)

    let l6: UInt8 = 255
    m = {value: UInt8 => match (value) {
        case 255 => 1
        case _ => 2
    } }(l6)
    Assert.equals(1, m)

    let l7: UInt16 = 65535
    m = {value: UInt16 => match (value) {
        case 65535 => 1
        case _ => 2
    } }(l7)
    Assert.equals(1, m)

    let l8: UInt32 = 4294967295
    m = {value: UInt32 => match (value) {
        case 4294967295 => 1
        case _ => 2
    } }(l8)
    Assert.equals(1, m)

    let l9: UInt64 = 18446744073709551615
    m = {value: UInt64 => match (value) {
        case 18446744073709551615 => 1
        case _ => 2
    } }(l9)
    Assert.equals(1, m)

    let l10 = 0x10
    m = {value: Int64 => match (value) {
        case 0x10 => 1
        case _ => 2
    } }(l10)
    Assert.equals(1, m)

    let l11 = 0b10
    m = {value: Int64 => match (value) {
        case 0b10 => 1
        case _ => 2
    } }(l11)
    Assert.equals(1, m)

    let l12 = 0o10
    m = {value: Int64 => match (value) {
        case 0o10 => 1
        case _ => 2
    } }(l12)
    Assert.equals(1, m)

    return
}
