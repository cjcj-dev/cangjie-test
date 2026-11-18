/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_03_a01_05

  @Level:         1

  @Assertion:    3.3(1) As a statically typed language, the Cangjie programming language requires that the type of each
                  variable must be determined during compilation.

  @Description:  Check that variable declaration using keyword 'var' with type and initialisation with right values
                  will not produce error on compilation.

  @Mode:         compileonly

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

main() {
    var nameVarInt8: Int8 = 127
    Assert.equals(1, [nameVarInt8].size)
    var nameVarInt16: Int16 = 32767
    Assert.equals(1, [nameVarInt16].size)
    var nameVarInt32: Int32 = 2147483647
    Assert.equals(1, [nameVarInt32].size)
    var nameVarInt64: Int64 = 9223372036854775807
    Assert.equals(1, [nameVarInt64].size)

    var nameVarUInt8: UInt8 = 255
    Assert.equals(1, [nameVarUInt8].size)
    var nameVarUInt16: UInt16 = 65535
    Assert.equals(1, [nameVarUInt16].size)
    var nameVarUInt32: UInt32 = 4294967295
    Assert.equals(1, [nameVarUInt32].size)
    var nameVarUInt64: UInt64 = 4294967295
    Assert.equals(1, [nameVarUInt64].size)

    var nameVarFloat16: Float16 = 0.0
    Assert.equals(1, [nameVarFloat16].size)
    var nameVarFloat32: Float32 = 0.0
    Assert.equals(1, [nameVarFloat32].size)
    var nameVarFloat64: Float64 = 0.0
    Assert.equals(1, [nameVarFloat64].size)

    var nameVarByte: Byte = 255
    Assert.equals(1, [nameVarByte].size)

    var nameVarChar: Rune = 'S'
    Assert.equals(1, [nameVarChar].size)

    var nameVarBool: Bool = true
    Assert.equals(1, [nameVarBool].size)

    var nameVarString: String = "AAA"
    Assert.equals(1, [nameVarString].size)

    var nameVarRangeOfInt64: Range<Int64> = 0..5
    Assert.equals(1, [nameVarRangeOfInt64].size)
}