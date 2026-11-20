// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// The tryGet receiver is a real use of the initialized Future. The optimizer
// must keep the allocation, initializer and Spawn even though tryGet may
// legitimately return None when the worker has not finished yet.

// DEPENDENCE: ../pick_defination.py check_retained_future.mjs
// EXEC: %compiler %cmp_opt %enableO2 %dumpCHIRDebug -Woff unused %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_RedundantFutureOpt.chirtxt "Func @_CN7default6<main>Hv" | node check_retained_future.mjs tryGet
// RUN-EXEC-PIPE-0: %run main

main(): Int64 {
    let f = spawn {
        => return 7
    }
    match (f.tryGet()) {
        case Some(v) => v - 7
        case None => 0
    }
}
