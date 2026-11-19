/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        A_02_04_a03_01

  @Level:         1
  @Assertion:   A.2.4(3)
                tupleType
                    : LPAREN NL* type (NL* COMMA NL* type)+ NL* RPAREN
                    ;
  @Description: Check some tuple types
  @Mode:        run
  @Negative:    no
  @Structure:   single
*/

import utils.assert.Assert

open class Class1 { }
interface I1 { }
class ImplementsI1 <: I1 { }
struct S1 { }
type MyType = Int16
enum HandGame {
    ROCK | PAPER | SCISSORS
}


main() {
    var v1: (Int16, Int64, Int8, IntNative)
    var v2: (
            UInt8,
            UInt16,
            UInt32,
            UInt64,
            UIntNative
        )
    var v3: (Float16, Float32, Float64,
            Rune, String, Bool)
    var v4: (Class1, I1, () -> Bool, (MyType, S1, HandGame))
    var v5: (Rune, Bool, Float32, ((Bool, (UIntNative, Float16), IntNative, Float64, Rune,
            Float64), Float32, (UIntNative, Float32), Rune, Float64), Bool)
    v1 = (1i16, 2, 3i8, IntNative(4))
    v2 = (1u8, 2u16, 3u32, 4u64, UIntNative(5))
    v3 = (1.0f16, 2.0f32, 3.0, r'x', "tuple", true)
    v4 = (Class1(), ImplementsI1(), { => true }, (7i16, S1(), HandGame.ROCK))
    v5 = (r'x', true, 1.0f32, ((true, (UIntNative(2), 3.0f16), IntNative(4), 5.0, r'y', 6.0),
             7.0f32, (UIntNative(8), 9.0f32), r'z', 10.0), false)
    Assert.equals(IntNative(4), v1[3])
    Assert.equals(UIntNative(5), v2[4])
    Assert.equals("tuple", v3[4])
    Assert.isTrue(v4[2]())
    Assert.isTrue(match (v4[3][2]) {
        case HandGame.ROCK => true
        case _ => false
    })
    Assert.equals(3.0f16, v5[3][0][1][1])
    return 0
}
