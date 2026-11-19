/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:      04_03_a15_20

  @Level:         1

  @Assertion: 4.3(15) When the context does not require some specific type, if
              the two branch types of ifexpression are T1 and T2, then the type
              of the if expression is the least common supertype T of T1 and T2.
              If the least common super type does not exist, a compilation 
              error is reported.
  @Description: Checks that an uncontextualized if with a function reference and
                a String value has Any as its least common supertype and
                preserves the value of the selected branch.
  @Mode: compileonly
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

var x = 0

func returnZero() {
    Assert.getRuntimeZero()
}

main() {
    for (branch in 0..2) {
        x = branch
        var v =
            if (x == 0) {
                returnZero
            } else {
                "returnZero"
            }
        if (branch == 0) {
            let selected = (v as (() -> Int64)).getOrThrow()
            Assert.equals(0, selected())
        } else {
            let selected = (v as String).getOrThrow()
            Assert.equals("returnZero", selected)
        }
    }
    return
}
