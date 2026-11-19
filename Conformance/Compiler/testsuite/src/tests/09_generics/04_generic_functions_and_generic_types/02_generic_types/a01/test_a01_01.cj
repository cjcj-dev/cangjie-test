/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_04_02_a01_01

  @Level:         1

  @Assertion: 9.4.2(1) If one or more type parameters are declared in the declaration of classes, interfaces, structs, 
              enum or typealias, they are called generic types. Syntax-wise, a type parameter is immediately followed 
              by the name (such as a class name or an interface name) and is enclosed in <>.

  @Description: Check generic types declaration.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

class GenericClass<T> {
    init(arg: T) {
        x = arg
    }

    var x: T
}

interface GenericInterface<T> {
    static func id(x: T) {
        return x
    }
}

struct GenericStruct<T> {
    GenericStruct(var x!: T) {}
}

enum GenericEnum<T> {
    | Data(T)
    | Code(Int64)
}

type GenericTypeAlias<T> = GenericInterface<T>

class C {}

func classify(value: GenericEnum<C>): Int64 {
    match (value) {
        case Data(x) => 1
        case Code(x) => 2
    }
}

main() {
    Assert.isTrue(GenericClass<C>(C()).x is C)
    Assert.isTrue(GenericInterface<C>.id(C()) is C)
    Assert.isTrue(GenericStruct<C>(x: C()).x is C)
    Assert.isTrue(GenericTypeAlias<C>.id(C()) is C)

    let value = classify(GenericEnum<C>.Data(C()))
    Assert.equals(1, value)
    Assert.equals(2, classify(GenericEnum<C>.Code(0)))
}

