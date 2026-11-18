/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_03_a01_06

  @Level:         1

  @Assertion:    3.3(1) As a statically typed language, the Cangjie programming language requires that the type of each
                  variable must be determined during compilation.

  @Description:  Check that variable declaration using keyword 'let' with type and initialisation with right values
                  will not produce error on compilation.

  @Mode:         compileonly

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

main() {

    let nameVarInt8: Int8 = 127
    Assert.equals(1, [nameVarInt8].size)
    let nameVarInt16: Int16 = 32767
    Assert.equals(1, [nameVarInt16].size)
    let nameVarInt32: Int32 = 2147483647
    Assert.equals(1, [nameVarInt32].size)
    let nameVarInt64: Int64 = 9223372036854775807
    Assert.equals(1, [nameVarInt64].size)

    let nameVarUInt8: UInt8 = 255
    Assert.equals(1, [nameVarUInt8].size)
    let nameVarUInt16: UInt16 = 65535
    Assert.equals(1, [nameVarUInt16].size)
    let nameVarUInt32: UInt32 = 4294967295
    Assert.equals(1, [nameVarUInt32].size)
    let nameVarUInt64: UInt64 = 4294967295
    Assert.equals(1, [nameVarUInt64].size)

    let nameVarFloat16: Float16 = 0.0
    Assert.equals(1, [nameVarFloat16].size)
    let nameVarFloat32: Float32 = 0.0
    Assert.equals(1, [nameVarFloat32].size)
    let nameVarFloat64: Float64 = 0.0
    Assert.equals(1, [nameVarFloat64].size)

    let nameVarByte: Byte = 255
    Assert.equals(1, [nameVarByte].size)

    let nameVarChar: Rune = 'S'
    Assert.equals(1, [nameVarChar].size)

    let nameVarBool: Bool = true
    Assert.equals(1, [nameVarBool].size)

    let nameVarString: String = "AAA"
    Assert.equals(1, [nameVarString].size)

    let nameVarRangeOfInt64: Range<Int64> = 0..5
    Assert.equals(1, [nameVarRangeOfInt64].size)

}