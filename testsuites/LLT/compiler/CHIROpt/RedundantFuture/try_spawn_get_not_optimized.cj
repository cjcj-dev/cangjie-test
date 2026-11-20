// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Control case for try_spawn_optimized.cj: calling `get()` means the
// Future really is used, so it must be kept even though the spawn sits inside
// a `try`. The Future has four users here (TryApply for <init>, TrySpawn,
// Debug, TryApply for get), which is one too many to fold.

// DEPENDENCE: ../pick_defination.py check_retained_future.mjs
// EXEC: %compiler %cmp_opt %enableO2 %dumpCHIRDebug -Woff unused %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_RedundantFutureOpt.chirtxt "Func @_CN7default6<main>Hv" | node check_retained_future.mjs trySpawn
// RUN-EXEC-PIPE-0: %run main

main(): Int64 {
    try {
        let f = spawn {
            => return 0
        }
        return f.get()
    } catch (e: Exception) {
        println("caught")
        return 1
    }
}
