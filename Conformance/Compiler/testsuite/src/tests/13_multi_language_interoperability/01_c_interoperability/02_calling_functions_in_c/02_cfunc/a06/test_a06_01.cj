/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_02_02_a06_01

  @Level:         1

  @Assertion:    13.1.2.2(6)  The types of functions declared/defined in the
                 preceding three forms are CFunc<(CPointer<Int8>) -> Unit>.

  @Description:  Check types of CFunc.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      

  @Issue: 0006421
*/

import utils.assert.Assert

// Case 1
foreign func free(ptr: CPointer<Int8>): Unit

// Case 2
@C
func callableInC(ptr: CPointer<Int8>) {
    Assert.equals(1, [ptr].size)
print("This function is defined in Cangjie.")
}

// Case 3
let f1: CFunc<(CPointer<Int8>) -> Unit> = { ptr =>
    Assert.equals(1, [ptr].size)
print("This function is defined with CFunc lambda.")
}

main() {
    var CB1: CFunc<(CPointer<Int8>)->Unit> = free
    var CB2: CFunc<(CPointer<Int8>)->Unit> = callableInC
    var CB3: CFunc<(CPointer<Int8>)->Unit> = f1
    Assert.equals(3, [CB1, CB2, CB3].size)
}