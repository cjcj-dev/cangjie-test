/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_02_a01_01

  @Level:         1

  @Assertion:    10.1.2(1) When the function f is called, it is first required
                 to determine which functions can be called, 
                 we call these functions are candidate set.
                 To construct a function candidate set, perform the following steps:

                 1. Search for a visible function set, that is, determine all visible functions 
                    based on the call expression and the context.

                 2.Check the type of functions in the visible function set.
                   The functions that pass the type check (that is, 
                   the functions that can be called) enter the candidate set.

  @Description:  Overloading test. For call   Check(IntNative(0))  private member
                 is candidate, but for  call kl.Check(IntNative(-5)) is not included

  @Mode:         run

  @Negative:     no

  @Structure:    single
                
*/


import utils.assert.Assert

class Klass {
    var o: Int32
    init(x: Int32) {
        this.o = x
    }
    
    private static func SCheck(arg:Int8) {
        Assert.equals(-1i8, arg)
    }
    private static func SCheck(arg:Int16) {
        Assert.equals(-2i16, arg)
    }
    private static func SCheck(arg:Int32) {
        Assert.equals(-3i32, arg)
    }
    private static func SCheck(arg:Int64) {
        Assert.equals(-4i64, arg)
    }
    
    private static func SCheck(arg:UInt8) {
        Assert.equals(1u8, arg)
    }
    private static func SCheck(arg:UInt16) {
        Assert.equals(2u16, arg)
    }
    private static func SCheck(arg:UInt32) {
        Assert.equals(3u32, arg)
    }
    private static func SCheck(arg:UInt64) {
        Assert.equals(4u64, arg)
    }
    
    private static func SCheck(arg:Float64) {
        Assert.equals(0.10f64, arg)
    }
    private static func SCheck(arg:Float32) {
        Assert.equals(0.2f32, arg)
    }
    private static func SCheck(arg:Float16) {
        Assert.equals(0.3f16, arg)
    }

    func Check(arg:Int8) {
        Assert.equals(1, [arg].size)
        SCheck(-1i8)
    }
    func Check(arg:Int16) {
        Assert.equals(1, [arg].size)
        SCheck(-2i16)
    }
    func Check(arg:Int32) {
        Assert.equals(1, [arg].size)
        SCheck(-3i32)
    }
    func Check(arg:Int64) {
        Assert.equals(1, [arg].size)
        SCheck(-4i64)
    }
    
    func Check(arg:UInt8) {
        Assert.equals(1, [arg].size)
        SCheck(1u8)
    }
    func Check(arg:UInt16) {
        Assert.equals(1, [arg].size)
        SCheck(2u16)
    }
    func Check(arg:UInt32) {
        Assert.equals(1, [arg].size)
        SCheck(3u32)
    }
    func Check(arg:UInt64) {
        Assert.equals(1, [arg].size)
        SCheck(4u64)
    }
    
    func Check(arg:Float64) {
        Assert.equals(1, [arg].size)
        SCheck(0.10f64)
    }
    func Check(arg:Float32) {
        Assert.equals(1, [arg].size)
        SCheck(0.2f32)
    }
    func Check(arg:Float16) {
        Assert.equals(1, [arg].size)
        SCheck(0.3f16)
    }

}
extend Klass {
    private static func SCheck(arg:IntNative) {
        Assert.equals(-5, arg)
    }
    func Check(arg:IntNative) {
        Assert.equals(1, [arg].size)
        SCheck(IntNative(-5))
    }
}

extend Klass {
    private static func SCheck(arg:UIntNative) {
        Assert.equals(5, arg)
    }
    private func Check(arg:IntNative, b:Bool) {
        Assert.equals(1, [(arg, b)].size)
        Assert.fail()
    }
    func Check(arg:UIntNative) {
        if (arg == 0) {
            Check(IntNative(0), true)
        }
        SCheck(UIntNative(5))
    }
}

main(ina :Array<String>) {
    Assert.equals(1, [ina].size)
    var kl:Klass = Klass(0);
    kl.Check(IntNative(-5))

    kl.Check(UIntNative(5))
    kl.Check(-1i8)
    kl.Check(-2i16)
    kl.Check(-3i32)
    kl.Check(-4i64)
    kl.Check(1u8)
    kl.Check(2u16)
    kl.Check(3u32)
    kl.Check(4u64)
    kl.Check(0.10f64)
    kl.Check(0.2f32)
    kl.Check(0.3f16)

    0
}
