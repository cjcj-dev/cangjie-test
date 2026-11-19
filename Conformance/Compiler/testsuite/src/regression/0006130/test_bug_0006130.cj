/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            bug_0006130
  @Assertion:       If-let must use '<-' instead of '='

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no

  @Comment:         CompilerBug v0.38.2. Verified for the Spec v0.22.14
*/

func someValue(): Option<Int64> {
    Some(100)
}

main(): Int64 {
    let x: Option<Int64> = someValue()
    // if-let expression without else branch
    if (let Some(v) <- x) {
        print("x has value")
    }
    // if-let expression with else branch
    if (let Some(v) <- x) {
        print("x has value")
    } else {
        print("x has not value")
    }
    return 0
}
