/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         bug_0006023
  @Assertion:    Bog 0006023: A non-working example of complex macros in the specification.
  @Description:  Checks a non-working example of complex macros in the specification.
  @Mode:         run
  @Negative:     no

  @Structure:    complex-main
  @Dependencies: C/c.cj
*/

import c.*
public import b.*

main() {
  var input = 111
  if (@M1(input) != 111) {
    return 1
  }
  if (F1(input) != 111) {
    return 1
  }
  if (@M2(input) != 112) {
    return 1
  }
  return 0
}
