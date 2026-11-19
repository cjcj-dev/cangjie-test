
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_16_a04_01

  @Level:         1

  @Assertion:   4.16(4) The syntax of relational expressions are defined as:
                equalityComparisonExpression
                    : comparisonExpression (equalityOperator comparisonExpression)?
                    ;
                comparisonOrTypeExpression
                    : shiftingExpression (comparisonOperator shiftingExpression)?
                    | ...
                    ;
                equalityOperator
                    : '!=' | '=='
                    ;
                comparisonOperator
                : '<' | '>' | '<=' | '>='
                ;
  @Description: Validates some examples illustrating the grammar definition above. 
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

main() {
    // comparisonOrTypeExpression
    Assert.equals(1, 1 + 2 - 3 * 4 % 5)
    Assert.equals(false, 1 + 2 - 3 * 4 % 5 > 1 + 2 - 3 * 4 % 5)
    Assert.equals(true, 1 + 2 - 3 * 4 % 5 >= 1 + 2 - 3 * 4 % 5)
    Assert.equals(false, 1 + 2 - 3 * 4 % 5 < 1 + 2 - 3 * 4 % 5)
    Assert.equals(true, 1 + 2 - 3 * 4 % 5 <= 1 + 2 - 3 * 4 % 5)

    // equalityComparisonExpression
    Assert.equals(false, 1 + 2 - 3 * 4 % 5 > 1 + 2 - 3 * 4 % 5)
    Assert.equals(true, 1 + 2 - 3 * 4 % 5 >= 1 + 2 - 3 * 4 % 5)
    Assert.equals(false, 1 + 2 - 3 * 4 % 5 < 1 + 2 - 3 * 4 % 5)
    Assert.equals(true, 1 + 2 - 3 * 4 % 5 <= 1 + 2 - 3 * 4 % 5)
    
    Assert.equals(true, 1 + 2 - 3 * 4 % 5 > 1 + 2 - 3 * 4 % 5 == 1 + 2 - 3 * 4 % 5 > 1 + 2 - 3 * 4 % 5)
    Assert.equals(true, 1 + 2 - 3 * 4 % 5 >= 1 + 2 - 3 * 4 % 5 == 1 + 2 - 3 * 4 % 5 >= 1 + 2 - 3 * 4 % 5)
    Assert.equals(true, 1 + 2 - 3 * 4 % 5 < 1 + 2 - 3 * 4 % 5 == 1 + 2 - 3 * 4 % 5 < 1 + 2 - 3 * 4 % 5)
    Assert.equals(true, 1 + 2 - 3 * 4 % 5 <= 1 + 2 - 3 * 4 % 5 ==  1 + 2 - 3 * 4 % 5 <= 1 + 2 - 3 * 4 % 5)

    Assert.equals(false, 1 + 2 - 3 * 4 % 5 > 1 + 2 - 3 * 4 % 5 != 1 + 2 - 3 * 4 % 5 > 1 + 2 - 3 * 4 % 5)
    Assert.equals(false, 1 + 2 - 3 * 4 % 5 >= 1 + 2 - 3 * 4 % 5 != 1 + 2 - 3 * 4 % 5 >= 1 + 2 - 3 * 4 % 5)
    Assert.equals(false, 1 + 2 - 3 * 4 % 5 < 1 + 2 - 3 * 4 % 5 != 1 + 2 - 3 * 4 % 5 < 1 + 2 - 3 * 4 % 5)
    Assert.equals(false, 1 + 2 - 3 * 4 % 5 <= 1 + 2 - 3 * 4 % 5 !=  1 + 2 - 3 * 4 % 5 <= 1 + 2 - 3 * 4 % 5)
    
    0
}
