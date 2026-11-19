/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_03_01_a23_01

  @Level:         1

  @Comment: It is a header of a list of assetions which include current assertion: 
            In addition to the preceding syntax definitions, local variables may be introduced 
            in the following scenarios:

  @Assertion:    3.3.1(23) Pattern after case in the match expression. For details, see Pattern Matching Expressions.

  @Description:  Patterns are used: enum, binding

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

enum EatUnit { 
    | Breakfast
    | Lunch
    | Diner
} 

func timeOfMeal(myEat: EatUnit): String {
    var eatTime: String = match (myEat) { 
        case Lunch => "14:00"
        case Branch =>
            Assert.isTrue(match (Branch) {
                case Breakfast => true
                case _ => false
            })
            "11:00"
    } 

    eatTime
}

main() {
    let myEat = EatUnit.Lunch
    Assert.equals("14:00", timeOfMeal(myEat))
    Assert.equals("11:00", timeOfMeal(EatUnit.Breakfast))
}