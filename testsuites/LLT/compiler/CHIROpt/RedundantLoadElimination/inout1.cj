// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../pick_defination.py foo.c
// EXEC: %clang %clang_shared_opt foo.c -o libfoo.%dylib_suffix
// EXEC: %compiler %cmp_opt %enableO2 %dumpCHIRDebug -Woff all %n.cj -L . -l foo
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_RedundantLoadElimination.chirtxt "Func @_CN7default6<main>Hv" | compare %f
// RUN-EXEC-PIPE-0: %pwd_to_ld_path %run main
// Keep load reuse within an interval that makes no opaque call. C code can
// retain the inout address; the second foreign call requires a fresh read.
// ASSERT: regex-begin %(?P<v>\d+): Int32 = Load\(%(?P<slot>\d+)\) // loc: "inout1.cj"-26-
// ASSERT: regex-after NumericCast\(%(?P=v)\) // loc: "inout1.cj"-26-
// ASSERT: regex-after NumericCast\(%(?P=v)\) // loc: "inout1.cj"-27-
// ASSERT: regex-after NumericCast\(%(?P=v)\) // loc: "inout1.cj"-28-
// ASSERT: regex-after = Load\(%(?P=slot)\) // loc: "inout1.cj"-33-
// ASSERT: regex-not = Load\(%\d+\) // loc: "inout1.cj"-27-
// ASSERT: regex-not = Load\(%\d+\) // loc: "inout1.cj"-28-
foreign func PlusOne(ptr: CPointer<Int32>): Unit

main(): Int64 {
    var a: Int32 = 0
    unsafe { PlusOne(inout a) }
    let first = Int64(a)
    let second = Int64(a)
    let third = Int64(a)
    println(first)
    println(second)
    println(third)
    unsafe { PlusOne(inout a) }
    let after = Int64(a)
    println(after)
    if (first != 1 || second != 1 || third != 1 || after != 2) {
        return 1
    }
    return 0
}
