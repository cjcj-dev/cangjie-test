/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            bug_0006068
  @Assertion:       Empty quote() is accepted by the selected implementations.

  @Description:     Compile an empty quote without changing its token generation or import.

  @Mode:            compileonly
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no

  @Comment:         CompilerBug v0.37.2, v0.38.2 or SpecBug v0.22.12, v0.22.13, v0.22.14
                    Implementation-compatibility decision 2026-11-17: official nightly 1.3.0-alpha.20261025001053 and compiler 385e74af83f1b88d82684b9d947cc78da23869ba accept this source; historical negative result is retained separately.
*/

import std.ast.*

main() {
    quote()
    0
}
