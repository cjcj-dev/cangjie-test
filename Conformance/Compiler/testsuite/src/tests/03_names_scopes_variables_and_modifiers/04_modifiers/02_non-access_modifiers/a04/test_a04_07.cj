/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_04_02_a04_07

  @Level:         1

  @Assertion:    3.4.2(4) redef means redefine the static members of the parent class, See class for details

  @Description:  Check that redefined functions can have different parameter names.

  @Mode:         run

  @Negative:     no

  @Structure:    single
*/

import utils.assert.Assert

open class C1 {
    static func foo(p1: String) { let observedArgument0 = [p1]; Assert.equals(1, observedArgument0.size);
        return "foo"
    }
}

class C2 <: C1 {
    redef static func foo(p2: String) { let observedArgument0 = [p2]; Assert.equals(1, observedArgument0.size);
        return "redefined foo"
    }
}

main() {
    Assert.equals("redefined foo", C2.foo("2023"))
}
