/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_06_a01_01

  @Level:         1

  @Assertion: 4.4.1.6(1) Enum patterns are often used together with enum types.

  @Description: Checks that enum patterns matches some of the examples of an enum.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

enum E1 {
    A | B
}

enum E2 {
    | I(Int64)
    | F(Float64)
}

enum E3<T> {
    | X1(T)
    | X2(T)
}

main() {
    var v1: E1 = A
    Assert.isTrue({value: E1 => match (value) {
        case A => true
        case B => false
    } }(v1))

    var v2: E1 = B
    Assert.isTrue({value: E1 => match (value) {
        case A => false
        case B => true
    } }(v2))

    var v3: E2 = I(10i64)
    Assert.isTrue({value: E2 => match (value) {
        case I(x) => true
        case F(x) => false
    } }(v3))

    var v4: E2 = F(10.5)
    Assert.isTrue({value: E2 => match (value) {
        case I(x) => false
        case F(x) => true
    } }(v4))

    var v5: E3<Rune> = X1<Rune>(r'a')
    Assert.isTrue({value: E3<Rune> => match (value) {
        case X1(x) => true
        case X2(x) => false
    } }(v5))

    var v6: E3<Rune> = X2<Rune>(r'a')
    Assert.isTrue({value: E3<Rune> => match (value) {
        case X1(x) => false
        case X2(x) => true
    } }(v6))

    return
}
