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
  @Assertion:    3.3.2.1(2) Note that each variable must be initialized before being used.
                 Otherwise, a compilation error is reported.

  @Description:  Checks that mutable variable can't be used after conditional initialization

  @Mode:         compileonly
  @Negative:     yes
  @Structure:    single

  @CompileWarning: no
  @Comment: Implementation decision 2026-11-17: official nightly 1.3.0-alpha.20261025001053 rejects the interpolation read as uninitialized, while compiler 385e74af83f1b88d82684b9d947cc78da23869ba accepts it. Keep the original negative expectation; this is not a jointly accepted compatibility case.
*/

main() {
    var a: String
    if (true) {
        a = "Alleluia"
    }

    print("${a}")
}
