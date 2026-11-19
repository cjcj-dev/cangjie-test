/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        A_02_04_a08_01

  @Level:         1
  @Assertion:   A.2.4(8)
                userType
                    : (identifier NL* DOT NL*)* identifier ( NL* typeArguments)?
                    ;

  @Description: Check various user types
  @Mode:        run
  @Negative:    no
  @Structure:   single
*/

import utils.assert.Assert

open class Class1 { }
open class Class2<T> { }
interface I1 { }
class ImplementsI1 <: I1 { }
struct S1 { }
type MyType = Int16
enum HandGame {
    ROCK | PAPER | SCISSORS
}


main() {
    var v1: Class1
    var v2: Class2<IntNative>
    var v3: I1
    var v4: MyType
    var v5: S1
    var v6: HandGame

    v1 = Class1()
    v2 = Class2<IntNative>()
    v3 = ImplementsI1()
    v4 = 12i16
    v5 = S1()
    v6 = HandGame.SCISSORS
    let classValue: Any = v1
    let genericValue: Any = v2
    let interfaceValue: Any = v3
    let structValue: Any = v5
    Assert.isTrue(classValue is Class1)
    Assert.isTrue(genericValue is Class2<IntNative>)
    Assert.isTrue(interfaceValue is I1)
    Assert.equals(12i16, v4)
    Assert.isTrue(structValue is S1)
    func isScissors(value: HandGame): Bool {
        match (value) {
            case HandGame.SCISSORS => true
            case _ => false
        }
    }
    Assert.isTrue(isScissors(v6))
    Assert.isFalse(isScissors(HandGame.ROCK))
    return 0
}
