/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_02_a02_07

  @Level:         1

  @Assertion:    1.2(2) Among them, the meaning of ; is fixed and indicates the end of an expression
                        or declaration regardless of where it appears, and multiple expressions
                        or declarations separated by ; can be written on the same line.

  @Description:  Check that several variable declarations on the same line can be separated by ';'.

  @Mode:         compileonly

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

main() {
    let x = 100 ; let y = 200 ; let z = 300
    Assert.equals(100, x)
    Assert.equals(200, y)
    Assert.equals(300, z)
}
