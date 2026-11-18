/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_02_a01_11

  @Level:         1

  @Assertion: 6.3.2(1)
              Class/Interface does not allow overload between static and instance member functions.
              If the names of static member functions and instance member functions
              (including those defined by the class/interface
              and inherited from super class or super interface) of a class/interface are the same,
              a compilation error is reported.

  @Description: Check that overloading is allowed in generic classes and interfaces between static functions

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

interface I1<U> {
    static func f() {
        return 1
    }
    static func f(x: Int64): Int64
}

interface I2<U> {
    static func f(x: Rune) {
        Assert.equals(1, [x].size)
        return 3
    }

    static func f(x: String): Int64
}

interface I3<U> <: I2<U> {
    static func f(x: Bool) {
        Assert.equals(1, [x].size)
        return 5
    }
    static func f(x: Unit): Int64
}

abstract class A<U> {
    static func f(x: Rune, y: Rune) {
        Assert.equals(1, [x].size)
        Assert.equals(1, [y].size)
        return 7
    }
    static func f(x: String, y!: Rune) {
        Assert.equals(1, [x].size)
        Assert.equals(1, [y].size)
        return 8
    }

    static func f<T>(x: T, y: T, z: T) {
        Assert.equals(1, [x].size)
        Assert.equals(1, [y].size)
        Assert.equals(1, [z].size)
        return 11
    }
    static func f<T>(x: Range<Int64>) {
        Assert.equals(1, [x].size)
        return 12
    }
}

class B<U> <: A<U> & I1<U> & I3<U> {
    public static func f(x: Int64) {
        Assert.equals(1, [x].size)
        return 2
    }
    public static func f(x: String) {
        Assert.equals(1, [x].size)
        return 4
    }
    public static func f(x: Unit) {
        Assert.equals((), x)
        return 6
    }

    static func f(x: () -> U) {
        Assert.equals(1, [x].size)
        return 9
    }
    static func f(x: () -> Int32) {
        Assert.equals(1, [x].size)
        return 10
    }

    static func f<T>(x: Array<Bool>) {
        Assert.equals(1, [x].size)
        return 13
    }
    static func f<T>(x: Float32) {
        Assert.equals(1, [x].size)
        return 14
    }
}

main() {
    Assert.equals(1, B<Int8>.f())
    Assert.equals(2, B<Int8>.f(1))
    Assert.equals(3, B<Int8>.f(r'o'))
    Assert.equals(4, B<Int8>.f("sret"))
    Assert.equals(5, B<Int8>.f(false))
    Assert.equals(6, B<Int8>.f(()))
    Assert.equals(7, B<Int8>.f(r']', r')'))
    Assert.equals(8, B<Int8>.f("fasf", y: r'v'))
    Assert.equals(9, B<Int8>.f({ => 1i8}))
    Assert.equals(10, B<Int8>.f({ => 1i32}))
    Assert.equals(11, B<Int8>.f((), (), ()))
    Assert.equals(12, B<Int8>.f<Unit>(1..10:1))
    Assert.equals(13, B<Int8>.f<Unit>([false, true]))
    Assert.equals(14, B<Int8>.f<Unit>(0.1f32))
}