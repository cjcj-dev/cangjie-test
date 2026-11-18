/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        A_02_05_a20_01

  @Level:         1
  @Assertion:   A.2.5(20)
                unsafeExpression
                    : UNSAFE NL* block
                    ;

  @Description: Check trivial unsafe expressions.
                Reference to other tests in additional_tests.txt.
  @Mode:        run
  @Negative:    no
  @Structure:   single
*/

import utils.assert.Assert

main() {
    var v1 : Int32 = unsafe { var v : Int32 = 0x7FFFFFFF; v };
    let v2 = unsafe { let l0: (Int8, Int8) -> Int8 = {a: Int8, b: Int8 => a + b }; l0 }
    var v3 = unsafe { var l1: () -> Float32 = {
            => 4.6
        }
        l1
    }
    let v4 = unsafe {
        let l2 = {a: Rune, b: Rune => String(a) + String(b)}
        l2
    }
    Assert.equals(Int32(0x7FFFFFFF), v1)
    Assert.equals(Int8(3), v2(1, 2))
    Assert.equals(Float32(4.6), v3())
    Assert.equals("ab", v4(r'a', r'b'))
    return 0
}
