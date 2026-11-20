/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-PIPE: %run %run_opt %output %run_utest_opt --bench --no-color | compare %f


/* SCAN-IN
Starting the benchmark `BenchClass.bench()`.
    Warming up for 1.000 s.
    Starting measurements of 100 batches. Measuring Duration.
    Max batch size: 5, estimated execution time: 5.031 s.
 */

@Test
@Configure[batchSize: 5]
class BenchClass {
    @Bench
    func bench() {
        sleep(10)
    }
}
