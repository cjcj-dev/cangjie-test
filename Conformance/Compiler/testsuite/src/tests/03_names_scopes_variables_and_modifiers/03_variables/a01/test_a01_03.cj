/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_03_a01_03

  @Level:         1

  @Assertion:    3.3(1) As a statically typed language, the Cangjie programming language requires that the type of each
                  variable must be determined during compilation.

  @Description:  Check that Letiable declaration using keyword 'let' with type will not produce error on compilation.

  @Mode:         compileonly

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

public let testA0103: String = "127"
let myTopLet = 'G'

class MyClass {
    static public let classLetStaticPublic: Int32 = 22
    public let classLetPublic: Range<Int64>
    static protected let classLetStaticProtected: Int32 =23 
    protected let classLetProtected: Rune
    static private let classLetStaticPrivate: Int32 = 24

    static func checkPrivateStorage() {
        Assert.equals(24i32, classLetStaticPrivate)
    }
    private let classLetPrivate: String
    static let classLetStatic: Int32 = 3
    let classLet: Float64
    MyClass(){
        classLet = 42.3
        classLetPrivate = "9ywesn"
        classLetPublic = 0..10:1
        classLetProtected = 'H'
    }
}

struct Point {
    let x: Int32
    let y: Int32
    init(x: Int32, y: Int32){
        this.x = x
        this.y = y
    }
} 

main() {
    let nameLetInt8: Int8
    let nameLetInt16: Int16
    let nameLetInt32: Int32
    let nameLetInt64: Int64
    let nameLetIntNative: IntNative

    let nameLetUInt8: UInt8
    let nameLetUInt16: UInt16
    let nameLetUInt32: UInt32
    let nameLetUInt64: UInt64
    let nameLetUIntNative: UIntNative

    let nameLetFloat16: Float16
    let nameLetFloat32: Float32
    let nameLetFloat64: Float64

    let nameLetByte: Byte

    let nameLetChar: Rune

    let nameLetBool: Bool

    let nameLetUnit: Unit

    let nameLetString: String

    let nameLetRangeOfInt64: Range<Int64>

    let nameLetPoint: Point


    MyClass.checkPrivateStorage()
    nameLetInt8 = 1i8
    Assert.equals(1i8, nameLetInt8)
    nameLetInt16 = 2i16
    Assert.equals(2i16, nameLetInt16)
    nameLetInt32 = 3i32
    Assert.equals(3i32, nameLetInt32)
    nameLetInt64 = 4
    Assert.equals(4, nameLetInt64)
    nameLetIntNative = IntNative(5)
    Assert.equals(IntNative(5), nameLetIntNative)
    nameLetUInt8 = 6u8
    Assert.equals(6u8, nameLetUInt8)
    nameLetUInt16 = 7u16
    Assert.equals(7u16, nameLetUInt16)
    nameLetUInt32 = 8u32
    Assert.equals(8u32, nameLetUInt32)
    nameLetUInt64 = 9u64
    Assert.equals(9u64, nameLetUInt64)
    nameLetUIntNative = UIntNative(10)
    Assert.equals(UIntNative(10), nameLetUIntNative)
    nameLetFloat16 = 1.0f16
    Assert.equals(1.0f16, nameLetFloat16)
    nameLetFloat32 = 2.0f32
    Assert.equals(2.0f32, nameLetFloat32)
    nameLetFloat64 = 3.0
    Assert.equals(3.0, nameLetFloat64)
    nameLetByte = b'A'
    Assert.equals(b'A', nameLetByte)
    nameLetChar = r'H'
    Assert.equals(r'H', nameLetChar)
    nameLetBool = true
    Assert.equals(true, nameLetBool)
    nameLetUnit = ()
    Assert.equals((), nameLetUnit)
    nameLetString = "typed"
    Assert.equals("typed", nameLetString)
    nameLetRangeOfInt64 = 0..10:1
    Assert.equals(0..10:1, nameLetRangeOfInt64)
    nameLetPoint = Point(1, 2)
    Assert.equals(1i32, nameLetPoint.x)
    Assert.equals(2i32, nameLetPoint.y)
}