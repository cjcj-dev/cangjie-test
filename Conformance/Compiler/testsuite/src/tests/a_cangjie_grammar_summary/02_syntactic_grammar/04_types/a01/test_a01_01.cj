/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        A_02_04_a01_01

  @Level:         1
  @Assertion:   A.2.4(1) 
                type
                    : arrowType
                    | tupleType
                    | prefixType
                    | atomicType
                    ;
  @Description: Check some arrow types
  @Mode:        run
  @Negative:    no
  @Structure:   single
*/

import utils.assert.Assert

main() {
    var v1: (String) -> Rune
    var v2: () -> Bool
    var v3: (Float16, () -> Bool) -> IntNative
    var v4: (Float16, Bool) -> (() -> String)
    v1 = {text: String => if (text == "rune") { r'R' } else { r'X' }}
    v2 = { => true }
    v3 = {amount: Float16, condition: () -> Bool =>
        if (amount == 3.0f16 && condition()) { IntNative(3) } else { IntNative(0) }
    }
    v4 = {amount: Float16, enabled: Bool =>
        { => if (amount == 2.0f16 && enabled) { "yes" } else { "no" }}
    }
    Assert.equals(r'R', v1("rune"))
    Assert.equals(true, v2())
    Assert.equals(IntNative(3), v3(3.0f16, v2))
    Assert.equals("yes", v4(2.0f16, true)())
    return 0
}
