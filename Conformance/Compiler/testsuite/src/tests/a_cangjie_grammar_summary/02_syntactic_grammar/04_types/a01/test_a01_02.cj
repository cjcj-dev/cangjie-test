/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        A_02_04_a01_02

  @Level:         1
  @Assertion:   A.2.4(1) 
                type
                    : arrowType
                    | tupleType
                    | prefixType
                    | atomicType
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
    var v1: (Int8, Int16, Int32, Int64, IntNative)
    var v2: (UInt8, UInt16, UInt32, UInt64, UIntNative)
    var v3: (Float16, Float32, Float64)
    var v4: (Rune, String, Bool)
    var v5: (Class1, I1, () -> Bool)
    var v6: (MyType, S1, HandGame)
    var v7: ((Float64, ((Float64, Int32, UIntNative, Float64, UInt8, (Float64,
     (Rune, Int32, Rune, (UInt16, UInt64, Int64, ((Rune, (Rune, Rune, Rune, (Float64,
     UInt64, Float16, Rune), UIntNative), UInt8, UInt16), Int8, UInt64, Rune, Rune))),
     Rune, (Float32, (Rune, Rune, Float64, Rune, Rune), Rune, UInt16), Float16)),
     (Rune, Rune), Float16, Float64, (Rune, IntNative, Int8, Float64, Float32, Float64)),
     Rune, Rune, ((Rune, UInt16, (UInt32, Rune, UIntNative, IntNative), Float16, (Float64,
     UInt16, Int8, (Float64, UInt16, Float64, Rune))), (Rune, (UInt64, Rune), (Int32, Float64,
     Rune, UInt8, (((Float64, Rune, (Float64, Int8, UInt8, (UIntNative, Float64, ((Float16,
     Float16, Float16, (Int8, (Float64, (Float16, Float32), Rune, Float64), Float32, Rune),
     (Float32, (Rune, Rune, UIntNative, Float16), Float64, ((Rune, (UInt32, Rune, ((Float64,
     (UInt32, (UIntNative, (UInt8, Float32, Float32, UInt64, Int32), (Rune, (Rune, IntNative,
     Float16, Rune, ((Int64, UInt32, (Float16, Rune, Float16), (Int16, Rune), Float32, UInt16),
     UInt8, (Rune, UIntNative, Float32, Int16, (UInt8, UInt16, Int64, (Rune, Rune, Float16,
     Rune, (Rune, Rune, Int16, Float64)), Int32)), (Rune, (Rune, Float64, Int32, UInt64, Rune,
     Rune), (Rune, Float32), Rune), Rune))), (Float16, Float64), Rune), Rune, Rune, Int16),
     Rune), Int32), Int16), Rune), Int8, (Float16, Rune, (Int8, Rune, (Float64, Rune, Int8,
     ((Rune, Float32), Float32, (Rune, Int8, UInt16, Rune), Rune, Rune, Int32)), (Int64,
     Float16, UInt16, Rune, Float16, Int8), (Rune, Rune, Float16, Float16, Rune, UInt64)),
     Rune, IntNative, Rune), Rune))), Rune, (Int32, Rune), Int8, (Float32, Rune, Rune,
     UIntNative, Rune, Float64), Rune), (((Rune, Float16, (Float16, Rune), Rune, Rune, Rune),
     (UInt16, Rune), Rune), Rune, Int8), (Int64, Rune, (Rune, Float32, ((Int64, UInt64, Rune,
     Rune), Float16, Rune, Rune, (Int8, Rune, UInt32)), UInt64, Int16, UInt32), Rune), ((Float32,
     UInt64, Int16, Int32), Rune, Rune, UInt64)), (Rune, (Rune, Rune, Rune, Rune, ((Int16,
     Rune, Float64, UInt32), Float16, Float32, (((Float16, (Rune, Float32, UInt16, UIntNative,
     Float32), (Int64, (UIntNative, Rune, UInt8, (Rune, (Float16, (Rune, Rune, UInt8, Rune,
     Float64, (Int16, (Float16, Rune), Int32, IntNative, Rune, (UInt8, (Rune, Rune, (Rune,
     UInt8, Rune, (Rune, UInt32, Int8, UInt32)), Float64)))), Rune)), Float64), Rune, Float64,
     (Rune, Float16, Float32, Float16, (Rune, Float64), Rune)), Rune, Rune), Int16, Float64,
     Rune), Float64, Float32), Rune, Float16), Float64), Int32)), (Float16, (Rune, UInt8),
     (IntNative, Float32, Rune, Float16, Rune, Int32), IntNative, Int32, Rune), Float64),
     (Rune, UInt16, Float16, (Float16, (Int8, Rune), Float32, Float64, Rune), (Float32, Float64,
     Rune, Float64), Rune), IntNative, (Int8, (Rune, UIntNative, Float64, Int64, Float64),
     Rune), Float64), (UInt16, UInt16, UIntNative), Int32), Float32), Rune, Rune), Float64),
     Float32), (Rune, Float32, (Float32, Rune, Float16), UInt64, UInt32, UInt64), Int64, (Int64,
     UIntNative, Float32, UInt8, Rune, (Rune, ((UIntNative, (Rune, Int32), UInt32, Float32,
     Rune, Rune), Rune, Rune, Float16), Rune, UInt16, (((UIntNative, IntNative, Float16, Int32),
     Rune, ((UInt32, Float64, Rune, Rune, Float64), Rune, Float32), Rune, Int32), (Rune, Float16),
     Float16, Float32))))

    v1 = (1i8, 2i16, 3i32, 4, IntNative(5))
    v2 = (1u8, 2u16, 3u32, 4u64, UIntNative(5))
    v3 = (1.0f16, 2.0f32, 3.0)
    v4 = (r'x', "tuple", true)
    v5 = (Class1(), ImplementsI1(), { => true })
    v6 = (6i16, S1(), HandGame.ROCK)
    v7 = ((6.0, ((6.0, 3i32, UIntNative(9), 6.0, 8u8, (6.0, (r'k', 3i32, r'k', (16u16, 64u64,
        7, ((r'k', (r'k', r'k', r'k', (6.0, 64u64, 1.0f16, r'k'), UIntNative(9)), 8u8, 16u16),
        1i8, 64u64, r'k', r'k'))), r'k', (2.0f32, (r'k', r'k', 6.0, r'k', r'k'), r'k', 16u16),
        1.0f16)), (r'k', r'k'), 1.0f16, 6.0, (r'k', IntNative(4), 1i8, 6.0, 2.0f32, 6.0)),
        r'k', r'k', ((r'k', 16u16, (32u32, r'k', UIntNative(9), IntNative(4)), 1.0f16, (6.0,
        16u16, 1i8, (6.0, 16u16, 6.0, r'k'))), (r'k', (64u64, r'k'), (3i32, 6.0, r'k', 8u8,
        (((6.0, r'k', (6.0, 1i8, 8u8, (UIntNative(9), 6.0, ((1.0f16, 1.0f16, 1.0f16, (1i8,
        (6.0, (1.0f16, 2.0f32), r'k', 6.0), 2.0f32, r'k'), (2.0f32, (r'k', r'k', UIntNative(9),
        1.0f16), 6.0, ((r'k', (32u32, r'k', ((6.0, (32u32, (UIntNative(9), (8u8, 2.0f32,
        2.0f32, 64u64, 3i32), (r'k', (r'k', IntNative(4), 1.0f16, r'k', ((7, 32u32, (1.0f16,
        r'k', 1.0f16), (2i16, r'k'), 2.0f32, 16u16), 8u8, (r'k', UIntNative(9), 2.0f32, 2i16,
        (8u8, 16u16, 7, (r'k', r'k', 1.0f16, r'k', (r'k', r'k', 2i16, 6.0)), 3i32)), (r'k',
        (r'k', 6.0, 3i32, 64u64, r'k', r'k'), (r'k', 2.0f32), r'k'), r'k'))), (1.0f16, 6.0),
        r'k'), r'k', r'k', 2i16), r'k'), 3i32), 2i16), r'k'), 1i8, (1.0f16, r'k', (1i8, r'k',
        (6.0, r'k', 1i8, ((r'k', 2.0f32), 2.0f32, (r'k', 1i8, 16u16, r'k'), r'k', r'k', 3i32)),
        (7, 1.0f16, 16u16, r'k', 1.0f16, 1i8), (r'k', r'k', 1.0f16, 1.0f16, r'k', 64u64)),
        r'k', IntNative(4), r'k'), r'k'))), r'k', (3i32, r'k'), 1i8, (2.0f32, r'k', r'k',
        UIntNative(9), r'k', 6.0), r'k'), (((r'k', 1.0f16, (1.0f16, r'k'), r'k', r'k', r'k'),
        (16u16, r'k'), r'k'), r'k', 1i8), (7, r'k', (r'k', 2.0f32, ((7, 64u64, r'k', r'k'),
        1.0f16, r'k', r'k', (1i8, r'k', 32u32)), 64u64, 2i16, 32u32), r'k'), ((2.0f32, 64u64,
        2i16, 3i32), r'k', r'k', 64u64)), (r'k', (r'k', r'k', r'k', r'k', ((2i16, r'k', 6.0,
        32u32), 1.0f16, 2.0f32, (((1.0f16, (r'k', 2.0f32, 16u16, UIntNative(9), 2.0f32),
        (7, (UIntNative(9), r'k', 8u8, (r'k', (1.0f16, (r'k', r'k', 8u8, r'k', 6.0, (2i16,
        (1.0f16, r'k'), 3i32, IntNative(4), r'k', (8u8, (r'k', r'k', (r'k', 8u8, r'k', (r'k',
        32u32, 1i8, 32u32)), 6.0)))), r'k')), 6.0), r'k', 6.0, (r'k', 1.0f16, 2.0f32, 1.0f16,
        (r'k', 6.0), r'k')), r'k', r'k'), 2i16, 6.0, r'k'), 6.0, 2.0f32), r'k', 1.0f16),
        6.0), 3i32)), (1.0f16, (r'k', 8u8), (IntNative(4), 2.0f32, r'k', 1.0f16, r'k', 3i32),
        IntNative(4), 3i32, r'k'), 6.0), (r'k', 16u16, 1.0f16, (1.0f16, (1i8, r'k'), 2.0f32,
        6.0, r'k'), (2.0f32, 6.0, r'k', 6.0), r'k'), IntNative(4), (1i8, (r'k', UIntNative(9),
        6.0, 7, 6.0), r'k'), 6.0), (16u16, 16u16, UIntNative(9)), 3i32), 2.0f32), r'k', r'k'),
        6.0), 2.0f32), (r'k', 2.0f32, (2.0f32, r'k', 1.0f16), 64u64, 32u32, 64u64), 7, (7,
        UIntNative(9), 2.0f32, 8u8, r'k', (r'k', ((UIntNative(9), (r'k', 3i32), 32u32, 2.0f32,
        r'k', r'k'), r'k', r'k', 1.0f16), r'k', 16u16, (((UIntNative(9), IntNative(4), 1.0f16,
        3i32), r'k', ((32u32, 6.0, r'k', r'k', 6.0), r'k', 2.0f32), r'k', 3i32), (r'k', 1.0f16),
        1.0f16, 2.0f32))))
    Assert.equals(IntNative(5), v1[4])
    Assert.equals(UIntNative(5), v2[4])
    Assert.equals(2.0f32, v3[1])
    Assert.equals("tuple", v4[1])
    Assert.isTrue(v5[2]())
    Assert.equals(6i16, v6[0])
    Assert.equals(6.0, v7[0][0])
    Assert.equals(UIntNative(9), v7[0][1][0][2])
    return 0
}
