/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_04_02_a02_01

  @Level:         1

  @Assertion: 9.4.2(2) Multiple type parameters are separated by “,”.

  @Description: Check multiple type parameters.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

class GenericClass<T1, T2> {
    init(arg1: T1, arg2: T2) {
        x1 = arg1
        x2 = arg2
    }

    var x1: T1
    var x2: T2
}

interface GenericInterface<T1, T2> {
    static func makePair(x1: T1, x2: T2) {
        return (x1, x2)
    }
}

struct GenericStruct<T1, T2> {
    GenericStruct(var x1!: T1, var x2!: T2) {}
}

enum GenericEnum<T1, T2> {
    | Data1(T1)
    | Data2(T2)
    | ECode(Int64)
}

type GenericTypeAlias<T1, T2> = GenericInterface<T1, T2>

class A {}
class B {}

func classify(value: GenericEnum<A, B>): Int64 {
    match (value) {
        case Data1(x) => 1
        case Data2(x) => 2
        case ECode(x) => 3
    }
}

main() {
    Assert.isTrue(GenericClass<A, B>(A(), B()).x1 is A)
    Assert.isTrue(GenericClass<A, B>(A(), B()).x2 is B)
    Assert.isTrue(GenericInterface<A, B>.makePair(A(), B())[0] is A)
    Assert.isTrue(GenericInterface<A, B>.makePair(A(), B())[1] is B)
    Assert.isTrue(GenericStruct<A, B>(x1: A(), x2: B()).x1 is A)
    Assert.isTrue(GenericStruct<A, B>(x1: A(), x2: B()).x2 is B)
    Assert.isTrue(GenericTypeAlias<A, B>.makePair(A(), B())[0] is A)
    Assert.isTrue(GenericTypeAlias<A, B>.makePair(A(), B())[1] is B)

    let value1 = classify(GenericEnum<A, B>.Data1(A()))
    Assert.equals(1, value1)
    let value2 = classify(GenericEnum<A, B>.Data2(B()))
    Assert.equals(2, value2)
    Assert.equals(3, classify(GenericEnum<A, B>.ECode(0)))
}

