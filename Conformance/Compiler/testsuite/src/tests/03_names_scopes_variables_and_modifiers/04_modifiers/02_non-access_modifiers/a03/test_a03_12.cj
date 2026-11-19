/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_04_02_a03_12

  @Level:         1

  @Assertion:    3.4.2(3) override means overriding a member of the parent class, See class for details

  @Description:  Check that generic functions can have override modifier

  @Mode:         compileonly

  @Negative:     no

  @Structure:    single
*/

import utils.assert.Assert

open class C1 {
    open public func foo<T>(a: T, b: T) {
        let second: Any = b
        Assert.isTrue(second is T)
        return a
    }
}

class C2 <: C1 {
    override public func foo<T>(a: T, b: T) {
        let first: Any = a
        Assert.isTrue(first is T)
        return b
    }
}

main() {
    var obj = C2()
    let inherited: C1 = obj
    Assert.equals(2, inherited.foo<Int64>(1, 2))
    Assert.equals(1, C1().foo<Int64>(1, 2))
}
