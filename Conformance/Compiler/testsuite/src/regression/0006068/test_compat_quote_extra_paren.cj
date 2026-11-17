/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name: compat_quote_extra_paren
  @Assertion: An extra closing parenthesis is rejected at that parenthesis.
  @Description: Independent control for the 2026-11-17 implementation-compatibility decision.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no
*/

import std.ast.*

main() {
    quote())
    0
}
