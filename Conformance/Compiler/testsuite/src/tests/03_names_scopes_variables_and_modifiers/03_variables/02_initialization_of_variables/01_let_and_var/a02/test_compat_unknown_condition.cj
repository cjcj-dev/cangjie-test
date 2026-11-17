/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name: compat_unknown_condition
  @Assertion: A reachable read after an unknown condition requires definite initialization.
  @Description: Independent control for the 2026-11-17 implementation-compatibility decision.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no
*/

func read(flag: Bool): String {
    var a: String
    if (flag) {
        a = "Alleluia"
    }
    return a
}

main() {}
