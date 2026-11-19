/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_06_a03_01

  @Level:         1

  @Assertion: 4.4.1.6(3) The syntax of enum patterns is as follows.
              enumPattern
                  : (userType '.')? identifier enumPatternParameters?
                  ;
              enumPatternParameters
                  : '(' pattern (',' pattern)* ')'
                  ;

  @Description: Validates compilation of some examples illustrating the syntax definition above.
  @Mode: compileonly
  @Negative: no
  @Structure: single
  @CompileWarning: no
*/

import utils.assert.Assert

enum E {
    | EE(Rune)
}

enum F {
    | A
    | B(Int64)
    | C(Int64, Int64)
    | D(E)
}

func selectF(kind: Int64): F {
    match (kind) {
        case 0 => F.A
        case 1 => F.B(1)
        case 2 => F.C(1, 2)
        case _ => F.D(E.EE(r'E'))
    }
}

main() {
    let n = Assert.getRuntimeZero()
    let a = selectF(n)
    let b = selectF(n + 1)
    let c = selectF(n + 2)
    let d = selectF(n + 3)
    Assert.isTrue(match (a) {
        case F.A => true
        case _ => false
    })
    Assert.isTrue(match (a) {
        case A => true
        case _ => false
    })

    Assert.isTrue(match (b) {
        case B(1) => true
        case _ => false
    })
    Assert.isTrue(match (b) {
        case F.B(1) => true
        case _ => false
    })
    Assert.isTrue(match (b) {
        case F.B(foo) => true
        case _ => false
    })
    Assert.isTrue(match (b) {
        case F.B(_) => true
        case _ => false
    })
    Assert.isTrue(match (b) {
        case F.B(_: Int64) => true
        case _ => false
    })
    Assert.isTrue(match (b) {
        case F.B(foo: Int64) => true
        case _ => false
    })

    Assert.isFalse(match (c) {
        case B(1) => true
        case _ => false
    })
    Assert.isTrue(match (c) {
        case F.C(1, 2) => true
        case _ => false
    })
    Assert.isTrue(match (c) {
        case F.C(foo, 2) => true
        case _ => false
    })
    Assert.isTrue(match (c) {
        case F.C(_, 2) => true
        case _ => false
    })
    Assert.isTrue(match (c) {
        case F.C(_: Int64, 2) => true
        case _ => false
    })
    Assert.isTrue(match (c) {
        case F.C(foo: Int64, 2) => true
        case _ => false
    })

    Assert.isTrue(match (d) {
        case D(EE(r'E')) => true
        case _ => false
    })
    Assert.isTrue(match (d) {
        case F.D(EE(r'E')) => true
        case _ => false
    })
    Assert.isTrue(match (d) {
        case F.D(foo) => true
        case _ => false
    })
    Assert.isTrue(match (d) {
        case F.D(_) => true
        case _ => false
    })
    Assert.isTrue(match (d) {
        case F.D(_: E) => true
        case _ => false
    })
    Assert.isTrue(match (d) {
        case F.D(foo: E) => true
        case _ => false
    })
    Assert.isTrue(match (d) {
        case F.D(EE(foo)) => true
        case _ => false
    })

    return
}
