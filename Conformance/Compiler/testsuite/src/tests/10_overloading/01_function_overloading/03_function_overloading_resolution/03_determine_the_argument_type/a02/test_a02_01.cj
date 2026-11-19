/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_03_03_a02_01

  @Level:         1

  @Assertion:    10.1.3.3(2)
                 // Sub <: Base
                 func f(a: (Base)->Int64, b : Sub) {} //f1
                 func f(a: (Sub)->Int64, b: Base) {}         //f2
                 func g(a: Base): Int64 { 0 }         // g1
                 func g(a: Sub): Int64 { 0 }          // g2
                 func test() {
                      f(g, Base())    // Error, both of g can pass f2's type check.
                      f(g, Sub())    // OK
                 }
  
  @Description:   Overloading with arrow type
                 
  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

open class Base {}
open class Sub <: Base {}


func f(a: (Base)->Int64, b : Sub) { Assert.equals(1, [(a, b)].size) } //f1

func f(a: (Sub)->Int64, b: Base) { Assert.equals(1, [(a, b)].size) }         //f2

func g(a: Base): Int64 {
    Assert.equals(1, [a].size)
    Assert.fail()
}         // g1

func g(a: Sub): Int64 {
    Assert.equals(1, [a].size)
    0
}          // g2

 

func test() {
    f(g, Sub())    // OK
}


main(ina :Array<String>) {
    Assert.equals(1, [ina].size)
    test()
    let narrower: (Sub)->Int64 = { _ => 0 }
    f(narrower, Base())
    Assert.equals(0, g(Sub()))
}



