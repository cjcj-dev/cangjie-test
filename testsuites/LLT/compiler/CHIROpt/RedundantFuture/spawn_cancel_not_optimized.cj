// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Negative case: `cancel()` needs the Future itself, not its result, so the
// fold is still blocked even though nothing reads the spawned value. Guards
// against a fold keyed on "is the result used" rather than on the user count.

// DEPENDENCE: ../pick_defination.py check_retained_future.mjs
// EXEC: %compiler %cmp_opt %enableO2 %dumpCHIRDebug -Woff unused %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_RedundantFutureOpt.chirtxt "Func @_CN7default6<main>Hv" | node check_retained_future.mjs cancel
// RUN-EXEC-PIPE-0: %run main

main(): Int64 {
    let f = spawn {
        => return 7
    }
    f.cancel()
    return 0
}
