/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_05_02_a06_01

  @Level:         1

  @Assertion: 4.5.2(6) The while-let expression first evaluates the expression after <-
              (the type of the expression can be any type), and if the value of the expression
              matches the pattern after let, it executes the block after it, then recalculates
              the value of the expression and matches it again and determines whether to execute
              the loop again; if the match fails, it terminates the current while loop.
  @Description: Check that type of expression can be of any type
  @Mode: compileonly
  @Negative: no
  @Issue: 6473

*/

import utils.assert.Assert

struct S { }
class C { }
enum E { Foo | Bar }
type Func = (Int32, Bool) -> String

var evaluated = 0
var taggedTrue = 0
func tag (i: Int32, b: Bool) {
    if (b) { taggedTrue++ }
    "${i} {b}"
}

func observe<T>(value: T): T {
    evaluated++
    value
}

main() {
    while (let _ <- observe(())) { break }
    while (let _ <- observe(true)) { break }
    while (let _ <- observe("String")) { break }
    while (let _ <- observe(1)) { break }
    while (let _ <- observe(1.1)) { break }
    while (let _ <- observe(([1, 2], Foo))) { break }
    while (let _ <- observe(S())) { break }
    while (let _ <- observe(C())) { break }
    while (let _ <- observe(Some(true))) { break }
    while (let _ <- observe(Some(tag))) { break }
    while (let _ <- observe(None<Bool>)) { break }
    while (let _ <- observe(None<Func>)) { break }
    while (let _ <- observe(tag)) { break }
    while (let _ <- observe({ i: Int32, b: Bool, f: Func => f(i,b) })) { break }
    while (let _ <- observe({ i: Int32, b: Bool, f: Func => f(i,b) } (Int32(100), true, tag))) { break }

    while (let x <- observe(())) { break }
    while (let x <- observe(true)) { break }
    while (let x <- observe("String")) { break }
    while (let x <- observe(1)) { break }
    while (let x <- observe(1.1)) { break }
    while (let x <- observe(([1, 2], Foo))) { break }
    while (let x <- observe(S())) { break }
    while (let x <- observe(C())) { break }
    while (let x <- observe(Some(true))) { break }
    while (let x <- observe(Some(tag))) { break }
    while (let x <- observe(None<Bool>)) { break }
    while (let x <- observe(None<Func>)) { break }
    while (let x <- observe(tag)) { break }
    while (let x <- observe({ i: Int32, b: Bool, f: Func => f(i,b) })) { break }
    while (let x <- observe({ i: Int32, b: Bool, f: Func => f(i,b) } (Int32(100), true, tag))) { break }

    Assert.equals(30, evaluated)
    Assert.equals(2, taggedTrue)
    return 0
}
