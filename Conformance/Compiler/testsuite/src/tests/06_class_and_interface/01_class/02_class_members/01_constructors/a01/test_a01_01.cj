/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a01_01

  @Level:         1

  @Assertion: 6.1.2.1(1)
              In CangJie programming language, there are two types of class constructors:
              primary constructor and init constructor.

  @Description: Check that a class can have a primary constructor and init constructors

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

var constructor_counter = 0
var last_executed_constructor = ""

class NonGeneric {
  NonGeneric() {
    constructor_counter++
    last_executed_constructor = "NonGeneric.Primary"
  }
  init(x: Int64) {
    constructor_counter++
    last_executed_constructor = "NonGeneric.init(Int64)"
    Assert.equals(1, [x].size)
  }
  init(a: String, b: String) {
    constructor_counter++
    last_executed_constructor = "NonGeneric.init(String, String)"
    Assert.equals(1, [a].size)
    Assert.equals(1, [b].size)
  }
}

class Generic<T> {
  public Generic(a: Bool, b: Rune, c: Float64) {
    constructor_counter++
    last_executed_constructor = "Generic.Primary"
    Assert.equals(1, [a].size)
    Assert.equals(1, [b].size)
    Assert.equals(1, [c].size)
  }

  init() {
    constructor_counter++
    last_executed_constructor = "Generic.init()"
  }

  init(x: Bool) {
    constructor_counter++
    last_executed_constructor = "Generic.init(Bool)"
    Assert.equals(1, [x].size)
  }

  init(x: Rune) {
    constructor_counter++
    last_executed_constructor = "Generic.init(Rune)"
    Assert.equals(1, [x].size)
  }

  init(x: String) {
    constructor_counter++
    last_executed_constructor = "Generic.init(String)"
    Assert.equals(1, [x].size)
  }

  init(x: Int64) {
    constructor_counter++
    last_executed_constructor = "Generic.init(Int64)"
    Assert.equals(1, [x].size)
  }
}

abstract class Abstract {
  protected Abstract() {
    constructor_counter++
    last_executed_constructor = "Abstract.Primary"
  }

  init(x: Int64) {
    constructor_counter++
    last_executed_constructor = "Abstract.init(Int64)"
    Assert.equals(1, [x].size)
  }
}

class Child <: Abstract {
  Child() {
    super(12)
    Assert.equals("Abstract.init(Int64)", last_executed_constructor)
    constructor_counter++
    last_executed_constructor = "Child.Primary"
  }

  init(x: String) {
    super()
    Assert.equals("Abstract.Primary", last_executed_constructor)
    constructor_counter++
    last_executed_constructor = "Child.init(String)"
    Assert.equals(1, [x].size)
  }
}

main() {
  Assert.equals(0, constructor_counter)

  var case1 = NonGeneric()
  Assert.equals(1, [case1].size)
  Assert.equals(1, constructor_counter)
  Assert.equals("NonGeneric.Primary", last_executed_constructor)

  var case2 = NonGeneric(76)
  Assert.equals(1, [case2].size)
  Assert.equals(2, constructor_counter)
  Assert.equals("NonGeneric.init(Int64)", last_executed_constructor)

  var case3 = NonGeneric("", "")
  Assert.equals(1, [case3].size)
  Assert.equals(3, constructor_counter)
  Assert.equals("NonGeneric.init(String, String)", last_executed_constructor)

  var case4 = Generic<Unit>(false, r'a', 0.5)
  Assert.equals(1, [case4].size)
  Assert.equals(4, constructor_counter)
  Assert.equals("Generic.Primary", last_executed_constructor)

  var case5 = Generic<Bool>()
  Assert.equals(1, [case5].size)
  Assert.equals(5, constructor_counter)
  Assert.equals("Generic.init()", last_executed_constructor)

  var case6 = Generic<Int32>(true)
  Assert.equals(1, [case6].size)
  Assert.equals(6, constructor_counter)
  Assert.equals("Generic.init(Bool)", last_executed_constructor)

  var case7 = Generic<Float32>(r'a')
  Assert.equals(1, [case7].size)
  Assert.equals(7, constructor_counter)
  Assert.equals("Generic.init(Rune)", last_executed_constructor)

  var case8 = Generic<String>("1")
  Assert.equals(1, [case8].size)
  Assert.equals(8, constructor_counter)
  Assert.equals("Generic.init(String)", last_executed_constructor)

  var case9 = Generic<(Unit, Unit, Unit)>(3)
  Assert.equals(1, [case9].size)
  Assert.equals(9, constructor_counter)
  Assert.equals("Generic.init(Int64)", last_executed_constructor)

  var case10 = Child()
  Assert.equals(1, [case10].size)
  Assert.equals(11, constructor_counter)
  Assert.equals("Child.Primary", last_executed_constructor)

  var case11 = Child("Child")
  Assert.equals(1, [case11].size)
  Assert.equals(13, constructor_counter)
  Assert.equals("Child.init(String)", last_executed_constructor)
}
