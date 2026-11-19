/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        A_02_04_a02_01

  @Level:         1
  @Assertion:   A.2.4(2)
                arrowType
                    : arrowParameters NL* ARROW NL* type
                    ;
                arrowParameters
                    : LPAREN NL* (type (NL* COMMA NL* type)* NL*)? RPAREN
                    ;

  @Description: Check various arrow types
  @Mode:        run
  @Negative:    no
  @Structure:   single
*/


import utils.assert.Assert

main() {
    var v1: (Int8) -> Bool
    var v2: () -> Int16
    var v3: (Int32, Int64) -> IntNative
    var v4: (
        UInt8,
        UInt16,
        UInt32,
        UInt64)
        ->
        UIntNative
    v1 = { x: Int8 => x == 1i8 }
    v2 = { => 2i16 }
    v3 = { x: Int32, y: Int64 => IntNative(x) + IntNative(y) }
    v4 = { a: UInt8, b: UInt16, c: UInt32, d: UInt64 => UIntNative(a) + UIntNative(b) + UIntNative(c) + UIntNative(d) }
    Assert.isTrue(v1(1i8))
    Assert.equals(2i16, v2())
    Assert.equals(IntNative(3), v3(1i32, 2))
    Assert.equals(UIntNative(10), v4(1u8, 2u16, 3u32, 4u64))
    return 0
}
