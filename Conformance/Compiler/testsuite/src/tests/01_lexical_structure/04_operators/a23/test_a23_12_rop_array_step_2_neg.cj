/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_04_a23_12

  @Level:         1

  @Assertion:    1.4(23) .. ..= Range operator
 
  @Description:  Run time exc as step in range is not equal to 1

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:

  @Issue:        0006505

*/

import utils.assert.Assert

main(ina :Array<String>) {
    let carr:Array<Int32>=[0,1,2,3,4,5,6,7,8]
    let step = 2 + Assert.getRuntimeZero(ina)
    var caught = false
    try {
        let slice = carr[1..7:step]
        Assert.fail(reason: "slice accepted step ${step} and returned ${slice.size} elements")
    } catch (_: IllegalArgumentException) {
        caught = true
    }
    Assert.isTrue(caught)

    0
}
