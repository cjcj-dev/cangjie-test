/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_a02_22

  @Level:         1
  @Assertion: 4(2) Every expression has a type. The process of calculating the 
              value of an expression is called the evaluation of the expression.
  @Description: Checks that assignment expressions have type and value.
                Tests operators: '=', '+=', '-=', '**=', '*=', '/=', '%=', '&&=',
                '||=', '&=', '|=', '^=', '<<=', '>>='.
  @Mode: run
  @Negative: no
  @Structure: single
*/

import utils.assert.Assert

main() {
    var i: Int64
    var b: Bool

    let unit1 = (i = 5)
    Assert.equals(5, i)
    Assert.isTrue(unit1 is Unit)
    Assert.equals((), unit1, reason: "Unit1 should have value ()")

    let unit2 = (i += 1)
    Assert.equals(6, i)
    Assert.isTrue(unit2 is Unit)
    Assert.equals((), unit2, reason: "Unit2 should have value ()")

    let unit3 = (i -= 3)
    Assert.equals(3, i)
    Assert.isTrue(unit3 is Unit)
    Assert.equals<Unit>((), unit3, reason: "Unit3 should have value ()")

    let unit4 = (i **= 2)
    Assert.equals(9, i)
    Assert.isTrue(unit4 is Unit)
    Assert.equals((), unit4, reason: "Unit4 should have value ()")

    let unit5 = (i *= 2)
    Assert.equals(18, i)
    Assert.isTrue(unit5 is Unit)
    Assert.equals((), unit5, reason: "Unit5 should have value ()")

    let unit6 = (i /= 3)
    Assert.equals(6, i)
    Assert.isTrue(unit6 is Unit)
    Assert.equals((), unit6, reason: "Unit6 should have value ()")

    let unit7 = (i %= 5)
    Assert.equals(1, i)
    Assert.isTrue(unit7 is Unit)
    Assert.equals((), unit7, reason: "Unit7 should have value ()")

    // Make the second remainder assignment change i independently of the first.
    i += 5
    let unit8 = (i %= 5)
    Assert.equals(1, i)
    Assert.isTrue(unit8 is Unit)
    Assert.equals<Unit>((), unit8, reason: "Unit8 should have value ()")

    let unit9 = (b = false)
    Assert.isTrue(unit9 is Unit)
    Assert.isFalse(b)
    Assert.equals((), unit9, reason: "Unit9 should have value ()")

    let unit10 = (b ||= true)
    Assert.isTrue(unit10 is Unit)
    Assert.isTrue(b)
    Assert.equals((), unit10, reason: "Unit10 should have value ()")

    let unit11 = (b &&= false)
    Assert.isTrue(unit11 is Unit)
    Assert.isFalse(b)
    Assert.equals((), unit11, reason: "Unit11 should have value ()")

    let unit12 = (i &= 123456)
    Assert.isTrue(unit12 is Unit)
    Assert.equals(0, i)
    Assert.equals((), unit12, reason: "Unit12 should have value ()")

    let unit13 = (i &= 123456)
    Assert.isTrue(unit13 is Unit)
    Assert.equals(0, i)
    Assert.equals((), unit13, reason: "Unit13 should have value ()")

    let unit14 = (i |= 789012)
    Assert.isTrue(unit14 is Unit)
    Assert.equals(789012, i)
    Assert.equals((), unit14, reason: "Unit14 should have value ()")

    let unit15 = (i ^= 10)
    Assert.isTrue(unit15 is Unit)
    Assert.equals(789022, i)
    Assert.equals((), unit15, reason: "Unit15 should have value ()")

    let unit16 = (i <<= 10)
    Assert.isTrue(unit16 is Unit)
    Assert.equals(807958528, i)
    Assert.equals((), unit16, reason: "Unit16 should have value ()")

    let unit17 = (i >>= 10)
    Assert.isTrue(unit17 is Unit)
    Assert.equals(789022, i)
    Assert.equals((), unit17, reason: "Unit17 should have value ()")
}

