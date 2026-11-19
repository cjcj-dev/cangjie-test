/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_03_a01_08

  @Level:         1

  @Assertion:    3.3(1) As a statically typed language, the Cangjie programming language requires that the type of each
                  variable must be determined during compilation.

  @Description:  Check that variable declaration using keyword 'let' w/o type and with initialization with right values
                  will not produce error on compilation.

  @Mode:         compileonly

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

class MyClass {
    static public let classLetStaticPublic = 22
    public let classLetPublic = 0..10:1
    static protected let classLetStaticProtected =23 
    protected let classLetProtected = 'H'
    static private let classLetStaticPrivate = 24

    static func checkPrivateStorage() {
        Assert.equals(24, classLetStaticPrivate)
    }
    private let classLetPrivate = "9ywesn"
    static let classLetStatic = 3
    let classLet = 42.3
}

struct Point {
    let x = 11
    let y = 56.4
    let structLet = "DDD"
} 

main() {

    let nameVarInt8 = 127
    let nameVarInt16 = 32767
    let nameVarInt32 = 2147483647
    let nameVarInt64 = 9223372036854775807

    let nameVarUInt8 = 255
    let nameVarUInt16 = 65535
    let nameVarUInt32 = 4294967295
    let nameVarUInt64 = 4294967295

    let nameVarFloat16 = 0.0
    let nameVarFloat32 = 0.0
    let nameVarFloat64 = 0.0

    let nameVarByte = 255

    let nameVarChar = 'S'

    let nameVarBool = true

    let nameVarString = "AAA"

    let nameVarRangeOfInt64 = 0..5

    MyClass.checkPrivateStorage()
    Assert.equals(127, nameVarInt8)
    Assert.equals(32767, nameVarInt16)
    Assert.equals(2147483647, nameVarInt32)
    Assert.equals(9223372036854775807, nameVarInt64)
    Assert.equals(255, nameVarUInt8)
    Assert.equals(65535, nameVarUInt16)
    Assert.equals(4294967295, nameVarUInt32)
    Assert.equals(4294967295, nameVarUInt64)
    Assert.equals(0.0, nameVarFloat16)
    Assert.equals(0.0, nameVarFloat32)
    Assert.equals(0.0, nameVarFloat64)
    Assert.equals(255, nameVarByte)
    Assert.equals('S', nameVarChar)
    Assert.equals(true, nameVarBool)
    Assert.equals("AAA", nameVarString)
    Assert.equals(0..5, nameVarRangeOfInt64)
}