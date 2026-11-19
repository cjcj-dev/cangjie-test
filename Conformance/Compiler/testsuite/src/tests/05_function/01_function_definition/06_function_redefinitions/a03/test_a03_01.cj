/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_01_06_a03_01

  @Level:         1

  @Assertion:       5.1.6(3) Generic and non-generic functions of the same name never constitute redefinition. 

  @Description:     Check that non-generic and generic functions of the same name with the same parameter types are 
                    not considered to be redefined.

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/
import utils.assert.Assert

interface myInterface {
    static func myFunc<A>(a: A, b!: A): A
    static func myFunc(a: Int32, b!: Int32): Int32
}

class myClass {
  func myFunc0(a: Int32, b!: Int32): Int32 { Assert.equals(2i32, a); b + b }
  func myFunc0<A>(a: A, b!: A): A { Assert.equals(1, [a].size); b }
  private func myFunc1(a: Int32, b!: Int32): Int32 { b - a }
  private func myFunc1<A>(a: A, b!: A): A { Assert.equals(1, [a].size); b }
  func checkPrivateOverloads() {
    Assert.equals(2, myFunc1(2, b: 4))
    Assert.equals(r'Q', myFunc1<Rune>(r'f', b: r'Q'))
  }
}

struct myStruct {
  func myFunc(a: Int32, b!: Int32): Int32 { a + b}
  func myFunc<Q>(a: Q, b!: Q): Q { Assert.equals(1, [b].size); a}
}

enum myEnum { 
  A 

  func myFunc(a: Int32, b!: Int32): Int32 { a / b}
  func myFunc<A>(a: A, b!: A): A { Assert.equals(1, [a].size); b}
}

func myFunc(a: Int32, b!: Int32): Int32 { Assert.equals(6i32, b); a + 10 }
func myFunc<A>(a: A, b!: A): A { Assert.equals(1, [b].size); a }

func myParentFunc(a: Int32) {
  var b: Int32 = 12
  func myFunc(a: Int32, b!: Int32): Int32 { a + 10 - b } 
  func myFunc<A>(a: A, b!: A): A { Assert.equals(1, [a].size); b }
  var aaa: Int32 = myFunc<Int32>(12, b: 6)
  Assert.equals(6 ,aaa)
  return myFunc(a, b: b)
}

main() {
  Assert.equals(12, myFunc(2, b: 6))
  Assert.equals("2", myFunc<String>("2", b: "6"))
  Assert.equals(0, myParentFunc(2))

  var myClassImpl = myClass()
  myClassImpl.checkPrivateOverloads()
  Assert.equals(8, myClassImpl.myFunc0(2, b: 4))
  Assert.equals(r'Q', myClassImpl.myFunc0<Rune>(r'f', b: r'Q'))

  var myStructImpl = myStruct()
  Assert.equals(6, myStructImpl.myFunc(2, b: 4))
  var myVar: Float32 = 12.5
  Assert.equals(myVar, myStructImpl.myFunc<Float32>(myVar, b: myVar))

  Assert.equals(2, myEnum.A.myFunc(8, b: 4))
  Assert.equals(false, myEnum.A.myFunc<Bool>(true, b: false))
}
