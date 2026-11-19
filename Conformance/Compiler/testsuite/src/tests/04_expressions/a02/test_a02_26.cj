/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_a02_26

  @Level:         1
  @Assertion: 4(2) Every expression has a type. The process of calculating the 
              value of an expression is called the evaluation of the expression.
  @Description: Checks that composite expressions have type and value.
                Tests matches.
  @Mode: run
  @Negative: no
  @Structure: single

*/

import utils.assert.Assert

enum Foo {
    A | B | C
}

open class CC {
    public let id = 999;
} 

let arrI8: Array<UInt8>  = [72, 101, 108, 108, 111]
var j = 0

func matchValue(i: Int64, variant: Foo): Int64 {
    match (i) {
        case 0 => 0
        case 10 | 20 | 30 | 40 | 50 => 1
        case 60 => match(variant) {
            case A => 0
            case B => match {
                case i < 0 => 3
                case i == 0 => -3
                case _ =>
                    let c: CC = CC()
                    let cc = Some(c)
                    match (cc?.id) {
                        case c => 15
                    }
            }
            case C => 2
        }
        case 70 | 80 => match(j) {
            case 1 => 14
            case 2 => Int64(arrI8[2])
            case other => other
        }
        case 90 | 100 => match(1) {
            case _ => 0
        }
        case _ => -1
    }
}

main() {
    let matches: Int64 = matchValue(0, B)
    Assert.isTrue(matches is Int64)
    Assert.equals(0, matches)

    Assert.equals(0, matchValue(60, A), reason: "case 60 with A")
    Assert.equals(2, matchValue(60, C), reason: "case 60 with C")
    Assert.equals(15, matchValue(60, B), reason: "case 60 with B")
}
