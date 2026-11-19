/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_06_a02_07

  @Level:         1

  @Assertion: 4.4.1.6(2) enum pattern is used to match an enum constructor in the format constructorName
              (without parameters) or constructorName(pattern_1,pattern_2,... , pattern_k) (with parameters),
              with a number of comma- separated patterns (which can be any other type of pattern, and nesting is
              allowed) within parentheses to match each parameter in turn.

  @Description: Checks that the enum pattern matching an enum constructor with the type patten parameter.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

enum E {
    | A(Int8)
    | B(Int16)
    | C(Int32)
    | D(Int64)
    | E(UInt8)
    | F(UInt16)
    | G(UInt32)
    | H(UInt64)
    | I(IntNative)
    | J(Float32)
    | K(Float64)
    | L(Rune)
    | M(Byte)
    | N(String)
    | O(Bool)
    | P(Unit)
}

main() {
    Assert.isTrue({value: E => match (value) {
        case A(foo: Int8) => true
        case _ => false
    } }(A(1i8)))
    Assert.isTrue({value: E => match (value) {
        case B(foo: Int16) => true
        case _ => false
    } }(B(1i16)))
    Assert.isTrue({value: E => match (value) {
        case C(foo: Int32) => true
        case _ => false
    } }(C(1i32)))
    Assert.isTrue({value: E => match (value) {
        case D(foo: Int64) => true
        case _ => false
    } }(D(1i64)))
    Assert.isTrue({value: E => match (value) {
        case E.E(foo: UInt8) => true
        case _ => false
    } }(E.E(1u8)))
    Assert.isTrue({value: E => match (value) {
        case F(foo: UInt16) => true
        case _ => false
    } }(F(1u16)))
    Assert.isTrue({value: E => match (value) {
        case G(foo: UInt32) => true
        case _ => false
    } }(G(1u32)))
    Assert.isTrue({value: E => match (value) {
        case H(foo: UInt64) => true
        case _ => false
    } }(H(1u64)))
    Assert.isTrue({value: E => match (value) {
        case I(foo: IntNative) => true
        case _ => false
    } }(I(1)))
    Assert.isTrue({value: E => match (value) {
        case J(foo: Float32) => true
        case _ => false
    } }(J(10.0_f32)))
    Assert.isTrue({value: E => match (value) {
        case K(foo: Float64) => true
        case _ => false
    } }(K(0.5)))
    Assert.isTrue({value: E => match (value) {
        case L(foo: Rune) => true
        case _ => false
    } }(L(r'a')))
    Assert.isTrue({value: E => match (value) {
        case M(foo: Byte) => true
        case _ => false
    } }(M(b'a')))
    Assert.isTrue({value: E => match (value) {
        case N(foo: String) => true
        case _ => false
    } }(N("AAA")))
    Assert.isTrue({value: E => match (value) {
        case O(foo: Bool) => true
        case _ => false
    } }(O(true)))
    Assert.isTrue({value: E => match (value) {
        case P(foo: Unit) => true
        case _ => false
    } }(P(())))
    return
}
