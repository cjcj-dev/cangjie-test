/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_03_a02_01

  @Level:         1

  @Assertion:    10.1.3(2)
                 Function overloading Resolution
                 If there is exactly one matching function 
                 declaration, it is invoked

  @Description:  Only 1 right pretendent for call


  @Mode:         run

  @Negative:     no

  @Structure:    single

*/


import utils.assert.Assert

open class Klass {
    func foo(x: Float32) {
        x
    }
    func foo(x: Float64): Float32 {
        Float32(x) + 1.0f32
    }
    func goo(x: Float64) {
        Assert.equals(1, [x].size)
        Assert.fail()
    }
    

}

main(ina :Array<String>) {
    Assert.equals(1, [ina].size)
    var kl:Klass = Klass();
    let argument32: Float32 = 0.15f32
    let argument64: Float64 = 0.15f64
    Assert.equals(0.15f32, kl.foo(argument32))
    Assert.equals(Float32(argument64) + 1.0f32, kl.foo(argument64))
    let rejected: (Float64) -> Unit = kl.goo
    Assert.equals(1, [rejected].size)
    0
}
