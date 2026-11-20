// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Negative case: storing the Future into a container makes it outlive the
// spawn, and the collection call is a user of it, so the fold is blocked.
// This is what stops the pass from erasing a Future whose identity actually
// escapes. Any surviving user has the same effect -- a plain call that is not
// inlined away is enough, see spawn_arg_not_optimized.cj.

// DEPENDENCE: ../pick_defination.py check_retained_future.mjs
// EXEC: %compiler %cmp_opt %enableO2 %dumpCHIRDebug -Woff unused %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_RedundantFutureOpt.chirtxt "Func @_CN7default6<main>Hv" | node check_retained_future.mjs escapes
// RUN-EXEC-PIPE-0: %run main

import std.collection.*

main(): Int64 {
    var fs = ArrayList<Future<Int64>>()
    fs.add(spawn {
        => return 7
    })
    var count = 0
    for (f in fs) {
        count++
        if (f.get() != 7) {
            return 1
        }
    }
    if (count != 1) {
        return 1
    }
    return 0
}
