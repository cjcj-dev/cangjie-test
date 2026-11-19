/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_03_01_a09_02

  @Level:         1

  @Assertion:    10.1.3.1(9)
                 /* The inherited names are at the same scope level as the names defined or declared in the class.
                */
    open class Father {
         func f(x: Child) { print("in Father") }
    }
    class Child <: Father {
         func f(x: Father) { print("in Child") }
    }
    func display() {
         var obj: Child = Child()
         obj.f(Child())     // in Father
    }
  
  @Description:  Example with Father-Child classes taken form spec. With asserts.
  
  @Mode:         run

  @Negative:     no

  @Structure:    single

*/
import utils.assert.Assert


open class Father {
     func f(x: Child) { Assert.equals(1, [x].size); print("in Father") }
}
class Child <: Father {
     func f(x: Father) { Assert.equals(1, [x].size); Assert.fail()  }
}
func display() {
     var obj: Child = Child()
     obj.f(Child())     // in Father
     let rejected: (Father) -> Unit = obj.f
     Assert.equals(1, [rejected].size)
}


main(ina :Array<String>) {
    Assert.equals(1, [ina].size)
    display()
    0
}
