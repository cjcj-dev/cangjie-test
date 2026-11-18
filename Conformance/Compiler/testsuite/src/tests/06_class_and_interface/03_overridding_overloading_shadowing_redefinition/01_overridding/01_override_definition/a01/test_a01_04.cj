/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_01_01_a01_04

  @Level:         1

  @Assertion: 6.3.1.1(1)
              If a non-abstract and instance function
              with a name same as a function in the superclass is declared,
              the function can be declared with an optional modifier override
              (indicating that it overwrites the existing one).

  @Description: Check that the modifier 'override' is optional for functions
                that override functions. All the functions from supertypes are overloaded

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006425, 0006426

*/

import utils.assert.Assert

abstract class A {
    public open func f(x: Rune, y: String) { let checkedArgument0 = [x]; Assert.equals(1, checkedArgument0.size); let checkedArgument1 = [y]; Assert.equals(1, checkedArgument1.size);
        return 0
    }
    public func f(x: Rune, y: Rune): Int64
}

interface I {
    func f(x: String, y: Rune) { let checkedArgument0 = [x]; Assert.equals(1, checkedArgument0.size); let checkedArgument1 = [y]; Assert.equals(1, checkedArgument1.size);
        return 0
    }
    func f(x: String, y: String): Int64
}

class C1 <: A & I {
    public override func f(x: Rune, y: String) { let checkedArgument0 = [x]; Assert.equals(1, checkedArgument0.size); let checkedArgument1 = [y]; Assert.equals(1, checkedArgument1.size);
        return 11
    }
    public override func f(x: Rune, y: Rune) { let checkedArgument0 = [x]; Assert.equals(1, checkedArgument0.size); let checkedArgument1 = [y]; Assert.equals(1, checkedArgument1.size);
        return 12
    }

    public override func f(x: String, y: Rune) { let checkedArgument0 = [x]; Assert.equals(1, checkedArgument0.size); let checkedArgument1 = [y]; Assert.equals(1, checkedArgument1.size);
        return 13
    }
    public override func f(x: String, y: String) { let checkedArgument0 = [x]; Assert.equals(1, checkedArgument0.size); let checkedArgument1 = [y]; Assert.equals(1, checkedArgument1.size);
        return 14
    }
}

class C2 <: A & I {
    public func f(x: Rune, y: String) { let checkedArgument0 = [x]; Assert.equals(1, checkedArgument0.size); let checkedArgument1 = [y]; Assert.equals(1, checkedArgument1.size);
        return 21
    }
    public func f(x: Rune, y: Rune) { let checkedArgument0 = [x]; Assert.equals(1, checkedArgument0.size); let checkedArgument1 = [y]; Assert.equals(1, checkedArgument1.size);
        return 22
    }

    public func f(x: String, y: Rune) { let checkedArgument0 = [x]; Assert.equals(1, checkedArgument0.size); let checkedArgument1 = [y]; Assert.equals(1, checkedArgument1.size);
        return 23
    }
    public func f(x: String, y: String) { let checkedArgument0 = [x]; Assert.equals(1, checkedArgument0.size); let checkedArgument1 = [y]; Assert.equals(1, checkedArgument1.size);
        return 24
    }
}

class C3<T> <: A & I {
    public override func f(x: Rune, y: String) { let checkedArgument0 = [x]; Assert.equals(1, checkedArgument0.size); let checkedArgument1 = [y]; Assert.equals(1, checkedArgument1.size);
        return 31
    }
    public override func f(x: Rune, y: Rune) { let checkedArgument0 = [x]; Assert.equals(1, checkedArgument0.size); let checkedArgument1 = [y]; Assert.equals(1, checkedArgument1.size);
        return 32
    }

    public override func f(x: String, y: Rune) { let checkedArgument0 = [x]; Assert.equals(1, checkedArgument0.size); let checkedArgument1 = [y]; Assert.equals(1, checkedArgument1.size);
        return 33
    }
    public override func f(x: String, y: String) { let checkedArgument0 = [x]; Assert.equals(1, checkedArgument0.size); let checkedArgument1 = [y]; Assert.equals(1, checkedArgument1.size);
        return 34
    }
}

class C4<T> <: A & I {
    public func f(x: Rune, y: String) { let checkedArgument0 = [x]; Assert.equals(1, checkedArgument0.size); let checkedArgument1 = [y]; Assert.equals(1, checkedArgument1.size);
        return 41
    }
    public func f(x: Rune, y: Rune) { let checkedArgument0 = [x]; Assert.equals(1, checkedArgument0.size); let checkedArgument1 = [y]; Assert.equals(1, checkedArgument1.size);
        return 42
    }

    public func f(x: String, y: Rune) { let checkedArgument0 = [x]; Assert.equals(1, checkedArgument0.size); let checkedArgument1 = [y]; Assert.equals(1, checkedArgument1.size);
        return 43
    }
    public func f(x: String, y: String) { let checkedArgument0 = [x]; Assert.equals(1, checkedArgument0.size); let checkedArgument1 = [y]; Assert.equals(1, checkedArgument1.size);
        return 44
    }
}

main() {
    let c1 = C1()
    Assert.equals(11, c1.f(r'a', ""))
    Assert.equals(12, c1.f(r'a', r'a'))
    Assert.equals(13, c1.f("", r'a'))
    Assert.equals(14, c1.f("", ""))

    let c2 = C2()
    Assert.equals(21, c2.f(r'a', ""))
    Assert.equals(22, c2.f(r'a', r'a'))
    Assert.equals(23, c2.f("", r'a'))
    Assert.equals(24, c2.f("", ""))

    let c3 = C3<Unit>()
    Assert.equals(31, c3.f(r'a', ""))
    Assert.equals(32, c3.f(r'a', r'a'))
    Assert.equals(33, c3.f("", r'a'))
    Assert.equals(34, c3.f("", ""))

    let c4 = C4<Unit>()
    Assert.equals(41, c4.f(r'a', ""))
    Assert.equals(42, c4.f(r'a', r'a'))
    Assert.equals(43, c4.f("", r'a'))
    Assert.equals(44, c4.f("", ""))
}