/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_03_05_a09_01

  @Level:         1
  @Assertion:    15.3.5(9) The syntax of the synchronized expression is as follows:
    synchronizedExpression
         : 'synchronized' '(' identifier ')' block
         ;
    The above identifier is a ReentrantMutex object.

  @Description:  Checks that valid synchronized expression can be created

  @Mode:         run
  @Negative:     no
  @Structure:    single

*/

import std.sync.*  // Atomics
import utils.assert.Assert

func sync(m: Mutex) {
    synchronized (m) {
        return 0
    }
}

func acquireInWorker(m: Mutex): Bool {
    let worker = spawn {
        let acquired = m.tryLock()
        if (acquired) {
            m.unlock()
        }
        acquired
    }
    return worker.get()
}

func test(m: Mutex) {
    Assert.isTrue(acquireInWorker(m), reason: "Mutex should be unlocked")
}

main(): Int64 {
    let control = Mutex()
    synchronized (control) {
        Assert.isTrue(!acquireInWorker(control), reason: "Worker must not acquire a mutex held by this thread")
    }
    test(control)

    let m = Mutex()
    Assert.equals(0, sync(m))
    test(m)

    return 0
}
