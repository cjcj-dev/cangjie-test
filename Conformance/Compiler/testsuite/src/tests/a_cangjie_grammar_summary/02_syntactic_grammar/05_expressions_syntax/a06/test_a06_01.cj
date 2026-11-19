/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        A_02_05_a06_01

  @Level:         1
  @Assertion:   A.2.5(6)
                tupleLiteral
                    : LPAREN NL* expression (NL* COMMA NL*expression)+ NL* RPAREN
                    ;

  @Description: Check some tuple literals.
                Reference to other tests in additional_tests.txt.
  @Mode:        run
  @Negative:    no
  @Structure:   single
*/
import utils.assert.Assert

func foo() {
    321
}
func matched(e: Int64) {
    (e, match (e) {
        case 0 => 2 + 2
        case _ => 2 - 2
    })
}

main() {
    let first = (1,2)
    Assert.equals(1, first[0])
    Assert.equals(2, first[1])
    let ten = (1,2,3,4,5,6,7,8,9,10)
    Assert.equals(10, ten[9])
    let arithmetic = (1 + 1, 2 - 2, 3 * 3, 4.0 / 4.0)
    Assert.equals(2, arithmetic[0])
    Assert.equals(0, arithmetic[1])
    Assert.equals(9, arithmetic[2])
    Assert.approxEquals(1.0, arithmetic[3])
    let mixed = (true, 's', "asdsad", 0x23.2p1, (), 11..22:3, foo, { => 42})
    Assert.equals("s", mixed[1])
    Assert.equals(321, mixed[6]())
    Assert.equals(42, mixed[7]())
    let nested = (true, ('s', ("asdsad", (0x23.2p1, ((), (11..22:3, (foo, ({ => 42}))))))))
    Assert.equals("asdsad", nested[1][1][0])
    Assert.equals(42, nested[1][1][1][1][1][1][1]())
    let grouped = ((true, 's'), ("asdsad", 0x23.2p1), ((), 11..22:3), (foo, { => 42}))
    Assert.isTrue(grouped[0][0])
    Assert.equals(11..22:3, grouped[2][1])
    Assert.equals(321, grouped[3][0]())
    let uneven = (true, ('s', ("asdsad", (0x23.2p1, ()), 11..22:3), foo), { => 42})
    Assert.equals("s", uneven[1][0])
    Assert.equals(321, uneven[1][2]())
    Assert.equals(42, uneven[2]())
    let again = (true, 's', "asdsad", 0x23.2p1, (), 11..22:3, foo, { => 42})
    Assert.approxEquals(70.25, again[3])
    let withElse = ('c', if ({=> false}()) { 1 } else { 0 })
    Assert.equals("c", withElse[0])
    Assert.equals(0, withElse[1])
    let withoutElse = ("Whaaat?", if ({=> false}()) { {=> 1}() })
    Assert.equals("Whaaat?", withoutElse[0])
    Assert.equals((), withoutElse[1])
    let byCase = matched(1)
    Assert.equals(1, byCase[0])
    Assert.equals(0, byCase[1])
    Assert.equals(4, matched(0)[1])
    var x = 1
    var mul = 1
    let loop = ("do-while", do {
        mul *= x
        x++
    } while (mul <= 10))
    Assert.equals("do-while", loop[0])
    Assert.equals((), loop[1])
    Assert.equals(24, mul)
    return 0
}
