/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_03_a01_01

  @Level:         1

  @Assertion:    3.3(1) As a statically typed language, the Cangjie programming language requires that the type of each
                  variable must be determined during compilation.

  @Description:  Check that variable declaration using keyword 'var' with type will not produce error on compilation.

  @Mode:         compileonly

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

public var myPublicTopVar: Float16 = 127.03
var myTopVar: Int32 = 127

class MyClass {
    static public var classVarStaticPublic: Int32 = 22
    public var classVarPublic: Range<Int64>
    static protected var classVarStaticProtected: Int32 =23 
    protected var classVarProtected: Rune
    static private var classVarStaticPrivate: Int32 = 24

    static func checkPrivateStorage() {
        Assert.equals(24i32, classVarStaticPrivate)
    }
    private var classVarPrivate: String
    static var classVarStatic: Int32 = 3
    var classVar: Float64
    MyClass(){
        classVar = 42.3
        classVarPrivate = "9ywesn"
        classVarPublic = 0..10:1
        classVarProtected = 'H'
    }
}

struct Point {
    var x: Int32
    var y: Int32
    init(x: Int32, y: Int32){
        this.x = x
        this.y = y
    }
} 

main() {
    var nameVarInt8: Int8
    var nameVarInt16: Int16
    var nameVarInt32: Int32
    var nameVarInt64: Int64
    var nameVarIntNative: IntNative

    var nameVarUInt8: UInt8
    var nameVarUInt16: UInt16
    var nameVarUInt32: UInt32
    var nameVarUInt64: UInt64
    var nameVarUIntNative: UIntNative

    var nameVarFloat16: Float16
    var nameVarFloat32: Float32
    var nameVarFloat64: Float64

    var nameVarByte: Byte

    var nameVarChar: Rune

    var nameVarBool: Bool

    var nameVarUnit: Unit

    var nameVarString: String

    var nameVarRangeOfInt64: Range<Int64>

    var nameVarPoint: Point


    MyClass.checkPrivateStorage()
    nameVarInt8 = 1i8
    Assert.equals(1i8, nameVarInt8)
    nameVarInt16 = 2i16
    Assert.equals(2i16, nameVarInt16)
    nameVarInt32 = 3i32
    Assert.equals(3i32, nameVarInt32)
    nameVarInt64 = 4
    Assert.equals(4, nameVarInt64)
    nameVarIntNative = IntNative(5)
    Assert.equals(IntNative(5), nameVarIntNative)
    nameVarUInt8 = 6u8
    Assert.equals(6u8, nameVarUInt8)
    nameVarUInt16 = 7u16
    Assert.equals(7u16, nameVarUInt16)
    nameVarUInt32 = 8u32
    Assert.equals(8u32, nameVarUInt32)
    nameVarUInt64 = 9u64
    Assert.equals(9u64, nameVarUInt64)
    nameVarUIntNative = UIntNative(10)
    Assert.equals(UIntNative(10), nameVarUIntNative)
    nameVarFloat16 = 1.0f16
    Assert.equals(1.0f16, nameVarFloat16)
    nameVarFloat32 = 2.0f32
    Assert.equals(2.0f32, nameVarFloat32)
    nameVarFloat64 = 3.0
    Assert.equals(3.0, nameVarFloat64)
    nameVarByte = b'A'
    Assert.equals(b'A', nameVarByte)
    nameVarChar = r'H'
    Assert.equals(r'H', nameVarChar)
    nameVarBool = true
    Assert.equals(true, nameVarBool)
    nameVarUnit = ()
    Assert.equals((), nameVarUnit)
    nameVarString = "typed"
    Assert.equals("typed", nameVarString)
    nameVarRangeOfInt64 = 0..10:1
    Assert.equals(0..10:1, nameVarRangeOfInt64)
    nameVarPoint = Point(1, 2)
    Assert.equals(1i32, nameVarPoint.x)
    Assert.equals(2i32, nameVarPoint.y)
}