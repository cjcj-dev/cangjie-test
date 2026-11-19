
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_21_a01_01

  @Level:         1

  @Assertion:   4.21(1) The coalescing expression is the expression containing the coalescing operator. The coalescing
                operator is represented by ??, and it is an infix binary operator. See below for the precedence and
                associativity of ??.
  @Description: Checks compilation and execution of a program that uses coalescing expressions. 
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

func numeric(n: Int64): ?Int64 {
    if (n == 0) { None } else { Some(2) }
}

func value(n: Int64): Any {
    if (n == 0) { "321" } else { r'1' }
}

main() {
    let zero = Assert.getRuntimeZero()
    Assert.equals(4, numeric(zero) ?? 4)
    Assert.equals(2, numeric(zero + 1) ?? 1)
    Assert.equals("321", value(zero) as String ?? "123")
    Assert.equals("2", value(zero + 1) as String ?? "2")
}
