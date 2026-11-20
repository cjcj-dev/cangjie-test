// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Negative case: reading the `thread` property is a plain member access rather
// than a call to get/tryGet, and it still counts as a user of the Future, so
// the fold is blocked. Guards against a fold keyed on a list of known reader
// methods instead of on the user count.

// DEPENDENCE: ../pick_defination.py check_retained_future.mjs
// EXEC: %compiler %cmp_opt %enableO2 %dumpCHIRDebug -Woff unused %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_RedundantFutureOpt.chirtxt "Func @_CN7default6<main>Hv" | node check_retained_future.mjs thread
// RUN-EXEC-PIPE-0: %run main

main(): Int64 {
    let f = spawn {
        => return 7
    }
    if (f.thread.id >= 0) {
        return 0
    }
    return 1
}
