/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_03_02_01_a02_04

  @Level:         1
  @Assertion:    A variable initialized on every reachable path may be used.

  @Description:  The constant-true branch initializes a before its subsequent interpolation.

  @Mode:         compileonly
  @Negative:     no
  @Structure:    single

  @CompileWarning: no
  @Comment: Implementation-compatibility decision 2026-11-17: official nightly 1.3.0-alpha.20261025001053 and compiler 385e74af83f1b88d82684b9d947cc78da23869ba accept this source; historical negative result is retained separately.
*/

main() {
    var a: String
    if (true) {
        a = "Alleluia"
    }

    print("${a}")
}
