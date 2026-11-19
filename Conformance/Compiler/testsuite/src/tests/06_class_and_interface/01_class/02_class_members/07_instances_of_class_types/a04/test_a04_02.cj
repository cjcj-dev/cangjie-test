/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_07_a04_02

  @Level:         1

  @Assertion: 6.1.2.7(4)
              Using ClassName<Type1, Type2, ... , TypeK>(arguments) for defining instances of generic classes.
              The only difference from defining an instance of a non-generic class is that type variables need to be
              instanced for generic classes, i.e., ‘Type1’ to ‘TypeN’ should be given or be inferred.

  @Description: Check that when creating an instance of a generic class with multiple constructors,
                the constructor that is geting called is chosen according to the rules
                of invoking overloaded functions

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006290, 0006291

*/

import utils.assert.Assert

open class Top {}
open class Parent <: Top {}
class Child <: Parent {}

var init_id = -1
var callback_id = -1
let child_callback = 1
let parent_callback = 2

class Test<T1, T2> {
    init() {
        init_id = 1
    }

    init(x: Int64) {
        let actual_x: Any = x
        Assert.isTrue(actual_x is Int64)
        init_id = 2
    }

    init(x: Int64, y: Int64) {
        let actual_x: Any = x
        Assert.isTrue(actual_x is Int64)
        let actual_y: Any = y
        Assert.isTrue(actual_y is Int64)
        init_id = 3
    }

    init(x: Int64, y: Int32) {
        let actual_x: Any = x
        Assert.isTrue(actual_x is Int64)
        let actual_y: Any = y
        Assert.isTrue(actual_y is Int32)
        init_id = 4
    }

    init(x!: Parent) {
        let actual_x: Any = x
        Assert.isTrue(actual_x is Parent)
        init_id = 5
    }

    init(x!: Child) {
        let actual_x: Any = x
        Assert.isTrue(actual_x is Child)
        init_id = 6
    }

    init(x: Parent, y: Parent) {
        let actual_x: Any = x
        Assert.isTrue(actual_x is Parent)
        let actual_y: Any = y
        Assert.isTrue(actual_y is Parent)
        init_id = 7
    }

    init(x: Child, y: Child) {
        let actual_x: Any = x
        Assert.isTrue(actual_x is Child)
        let actual_y: Any = y
        Assert.isTrue(actual_y is Child)
        init_id = 8
    }

    init(x: Parent, y: Child, z!: Bool = false) {
        let actual_x: Any = x
        Assert.isTrue(actual_x is Parent)
        let actual_y: Any = y
        Assert.isTrue(actual_y is Child)
        Assert.isFalse(z)
        init_id = 9
    }

    init(x!: Parent, y!: Parent, z!: Parent) {
        let actual_x: Any = x
        Assert.isTrue(actual_x is Parent)
        let actual_y: Any = y
        Assert.isTrue(actual_y is Parent)
        let actual_z: Any = z
        Assert.isTrue(actual_z is Parent)
        init_id = 10
    }

    init(x: (Parent) -> Unit) {
        let actual_x: Any = x
        Assert.isTrue(actual_x is (Parent) -> Unit)
        x(Child())
        init_id = 11
    }

    init(x: (Child) -> Unit) {
        let actual_x: Any = x
        Assert.isTrue(actual_x is (Child) -> Unit)
        x(Child())
        init_id = 12
    }

    init(x: (Parent) -> Unit, y: (Parent) -> Unit, z!: Bool = true) {
        let actual_x: Any = x
        Assert.isTrue(actual_x is (Parent) -> Unit)
        let actual_y: Any = y
        Assert.isTrue(actual_y is (Parent) -> Unit)
        Assert.isTrue(z)
        init_id = 13
    }

    init(x: (Parent) -> Unit, y: (Child) -> Unit) {
        let actual_x: Any = x
        Assert.isTrue(actual_x is (Parent) -> Unit)
        let actual_y: Any = y
        Assert.isTrue(actual_y is (Child) -> Unit)
        init_id = 14
    }

    init(x: (Child) -> Unit, y: (Child) -> Unit, z: (Child) -> Unit) {
        let actual_x: Any = x
        Assert.isTrue(actual_x is (Child) -> Unit)
        let actual_y: Any = y
        Assert.isTrue(actual_y is (Child) -> Unit)
        let actual_z: Any = z
        Assert.isTrue(actual_z is (Child) -> Unit)
        init_id = 15
    }

    init(x: (Child) -> Unit, y: Parent) {
        let actual_x: Any = x
        Assert.isTrue(actual_x is (Child) -> Unit)
        let actual_y: Any = y
        Assert.isTrue(actual_y is Parent)
        init_id = 16
    }

    init(x: (Parent) -> Unit, y: Child) {
        let actual_x: Any = x
        Assert.isTrue(actual_x is (Parent) -> Unit)
        let actual_y: Any = y
        Assert.isTrue(actual_y is Child)
        x(y)
        init_id = 17
    }

    init(x: T1) {
        let actual_x: Any = x
        Assert.isTrue(actual_x is T1)
        init_id = 18
    }

    init(x: T1, y: T2) {
        let actual_x: Any = x
        Assert.isTrue(actual_x is T1)
        let actual_y: Any = y
        Assert.isTrue(actual_y is T2)
        init_id = 19
    }

    init(x: T1, y: T1, z: T1) {
        let actual_x: Any = x
        Assert.isTrue(actual_x is T1)
        let actual_y: Any = y
        Assert.isTrue(actual_y is T1)
        let actual_z: Any = z
        Assert.isTrue(actual_z is T1)
        init_id = 20
    }

    init(x!: (T1) -> Unit, y!: (T2) -> Unit) {
        let actual_x: Any = x
        Assert.isTrue(actual_x is (T1) -> Unit)
        let actual_y: Any = y
        Assert.isTrue(actual_y is (T2) -> Unit)
        init_id = 21
    }
}

main() {
    Test<Bool, Bool>()
    Assert.equals(1, init_id)

    Test<String, Rune>(10)
    Assert.equals(2, init_id)

    Test<Float64, Float16>(10, 11)
    Assert.equals(3, init_id)

    Test<Float64, Float16>(10, 11i32)
    Assert.equals(4, init_id)

    Test<Top, Top>(x: Parent())
    Assert.equals(5, init_id)

    Test<Top, Top>(x: Child())
    Assert.equals(6, init_id)

    Test<Top, Top>(Child(), Parent())
    Assert.equals(7, init_id)

    Test<Top, Top>(Child(), Child())
    Assert.equals(8, init_id)

    Test<Top, Top>(Parent(), Child())
    Assert.equals(9, init_id)

    Test<Top, Top>(x: Child(), y: Child(), z: Child())
    Assert.equals(10, init_id)

    func l0(x: Top) { let value: Any = x; Assert.isTrue(value is Top) }
    func l1(x: Parent) { let value: Any = x; Assert.isTrue(value is Parent) }
    func l2(x: Child) { let value: Any = x; Assert.isTrue(value is Child) }
    Test<Top, Top>(l1)
    Assert.equals(11, init_id)

    // Here we have not only overloading of constructors
    // But also overloading of arguments
    // So first, the closest matching rule chooses between (Parent) -> Unit and (Child) -> Unit
    // The signature that will be chosen is (Parent) -> Unit since it's the most derived
    // After that the only of two f's that can be passed as the argument is f(x: Parent)
    func f(x: Child) {
        let value: Any = x
        Assert.isTrue(value is Child)
        callback_id = child_callback
    }
    func f(x: Parent) {
        let value: Any = x
        Assert.isTrue(value is Parent)
        callback_id = parent_callback
    }
    f(Child())
    Assert.equals(child_callback, callback_id)

    init_id = -1
    callback_id = -1
    Test<Top, Top>(f)
    Assert.equals(parent_callback, callback_id)
    Assert.equals(11, init_id)

    Test<Top, Top>(l2)
    Assert.equals(12, init_id)

    Test<Top, Top>(l1, l1)
    Assert.equals(13, init_id)

    Test<Top, Top>(l1, l2)
    Assert.equals(14, init_id)

    Test<Top, Top>(l1, l1, l1)
    Assert.equals(15, init_id)

    Test<Top, Top>(l2, Parent())
    Assert.equals(16, init_id)

    // Analogous to previous invocation with the 'f', just with more arguments
    init_id = -1
    callback_id = -1
    Test<Top, Top>(f, Child())
    Assert.equals(parent_callback, callback_id)
    Assert.equals(17, init_id)

    Test<Top, Top>(Top())
    Assert.equals(18, init_id)

    Test<Top, Top>(Top(), Child())
    Assert.equals(19, init_id)

    Test<Top, Top>(Top(), Parent(), Top())
    Assert.equals(20, init_id)

    Test<Top, Top>(x: l0, y: l0)
    Assert.equals(21, init_id)
}
