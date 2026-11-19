
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     16_02_a08_01

  @Level:         1

  @Assertion:   16.2(8) 6.enum constructor calls whose arguments are all const expressions, and enum constructors
                without parameters.
  @Description: Check that enum constructor calls whose arguments are all const expressions, and enum constructors
                without parameters are const expressions.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 6614

*/

import utils.assert.Assert

class C {
    const init() { }
}

struct S {
    const init() { }
}

enum E {
    E1 |
    E2(Int64) |
    E3(Rune, Bool) |
    E4(C, S) |
    ...
}

func checkVariant(value: E): Int64 {
    match (value) {
        case E1 => 1
        case E2(i) => i + 1
        case E3(r, b) => if (r == r'1' && b) { 3 } else { 0 }
        case E4(_: C, _: S) => 4
        case _ => 0
    }
}

main() {
    const c1 = E.E1
    const c2 = E.E2(1)
    const c3 = E.E3(r'1', true)
    const c4 = E.E4(C(), S())
    Assert.equals(1, checkVariant(c1))
    Assert.equals(2, checkVariant(c2))
    Assert.equals(3, checkVariant(c3))
    Assert.equals(4, checkVariant(c4))
    return 0
}
