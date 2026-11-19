
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_17_a02_01

  @Level:         1

  @Assertion:   4.17(2) The syntax of type test and type cast expressions is defined as:
                comparisonOrTypeExpression
                    : ...
                    | shiftingExpression ('is' type)?
                    | shiftingExpression ('as' userType)?
                    ;
  @Description: Validates some examples illustrating the grammar definition above. 
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

main() {
    let expr = 1.0
    -expr as Int64
    -(-expr) is UIntNative
    expr ** expr as Rune
    expr * expr is String
    expr / expr as Float64
    Int64(expr) % Int64(expr) << 1 as UInt64
    expr + expr is (Rune, Bool)
    let useFloat = Assert.getRuntimeZero() == 0
    let offset: Any = if (useFloat) { expr } else { 2i32 }
    Assert.equals(-1, offset as Int32 ?? 5 - (offset as Int32 ?? 6))
    Int64(expr) << Int64(expr)
    -(-expr) ** expr as Unit
    -(-expr) ** expr ** expr is Bool
    let kinds: Any = if (useFloat) { expr } else { true }
    Assert.isFalse(kinds is Bool && (expr + expr) is Array<String>)
    0
}
