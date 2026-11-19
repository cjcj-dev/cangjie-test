/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_03_07_a06_01

  @Level:         1
  @Assertion:    15.3.7(6) Example: Use MultiConditionMonitor to implement a
                 “fixed-length bounded FIFO queue”, when the queue is empty,
                 get() will be blocked; when the queue is full, put() will be
                 blocked.

    class BoundedQueue {
        // Create a MultiConditionMonitor, two Conditions.
        let m: MultiConditionMonitor = MultiConditionMonitor()
        var notFull: ConditionID
        var notEmpty: ConditionID
        var count: Int64 // Object count in buffer.
        var head: Int64  // Write index.
        var tail: Int64  // Read index.
        // Queue's length is 100.
        let items: Array<Object> = Array<Object>(100, {i => Object()})
        init() {
            count = 0
            head = 0
            tail = 0
            synchronized(m) {
               notFull  = m.newCondition()
               notEmpty = m.newCondition()
            }
        }
        // Insert an object, if the queue is full, block the current thread.
        public func put(x: Object) {
            // Acquire the mutex.
            synchronized(m) {
              while (count == 100) {
                 // If the queue is full, wait for the "queue notFull" event.
                 m.wait(notFull)
               }
               items[head] = x
               head++
               if (head == 100) {
                 head = 0
               }
              count++
              // An object has been inserted and the current queue is no longer
              // empty, so wake up the thread previously blocked on get()
              // because the queue was empty.
              m.notify(notEmpty)
            } // Release the mutex.
        }
        // Pop an object, if the queue is empty, block the current thread.
        public func get(): Object {
            // Acquire the mutex.
            synchronized(m) {
               while (count == 0) {
                  // If the queue is empty, wait for the "queue notEmpty" event.
                 m.wait(notEmpty)
               }
               let x: Object = items[tail]
               tail++
               if (tail == 100) {
                  tail = 0
               }
               count--
               // An object has been popped and the current queue is no longer
               // full, so wake up the thread previously blocked on put()
               // because the queue was full.
               m.notify(notFull)
               return x
            } // Release the mutex.
        }
    }


  @Description:  Checks that example from the spec works

  @Mode:         run
  @Negative:     no
  @Structure:    single

*/

import utils.assert.Assert

import std.sync.*  // Concurrency

class BoundedQueue {
    // Create a MultiConditionMonitor, two Conditions.
    let m = Mutex()
    var notFull: Condition
    var notEmpty: Condition
    private var waitStarted: Condition
    private var fullWaits = 0
    private var emptyWaits = 0
    var count: Int64 // Object count in buffer.
    var head: Int64  // Write index.
    var tail: Int64  // Read index.
    // Queue's length is 100.
    let items: Array<Object> = Array<Object>(100, {_ => Object()})

    init() {
        count = 0
        head = 0
        tail = 0
        synchronized(m) {
            notFull  = m.condition()
            notEmpty = m.condition()
            waitStarted = m.condition()
        }
    }

    // Insert an object, if the queue is full, block the current thread.
    public func put(x: Object) {
        // Acquire the mutex.
        synchronized(m) {
            while (count == 100) {
                // If the queue is full, wait for the "queue notFull" event.
                fullWaits++
                waitStarted.notify()
                notFull.wait()
            }
            items[head] = x
            head++
            if (head == 100) {
                head = 0
            }
            count++
            // An object has been inserted and the current queue is no longer
            // empty, so wake up the thread previously blocked on get()
            // because the queue was empty.
            notEmpty.notify()
        } // Release the mutex.
    }

    func expectWaiting(whenFull: Bool) {
        synchronized(m) {
            Assert.isTrue(waitStarted.waitUntil({ =>
                (if (whenFull) { fullWaits } else { emptyWaits }) > 0
            }, timeout: Duration.second * 5), reason: "worker did not enter the queue wait")
            // The worker signalled under m; we can own m only after it releases m.
            // No opposing operation has run, so the boundary must still hold.
            if (whenFull) {
                Assert.equals(100, count, reason: "put must remain blocked while full")
            } else {
                Assert.equals(0, count, reason: "get must remain blocked while empty")
            }
        }
    }

    // Pop an object, if the queue is empty, block the current thread.
    public func get(): Object {
        // Acquire the mutex.
        synchronized(m) {
            while (count == 0) {
                // If the queue is empty, wait for the "queue notEmpty" event.
                emptyWaits++
                waitStarted.notify()
                notEmpty.wait()
            }
            let x: Object = items[tail]
            tail++
            if (tail == 100) {
                tail = 0
            }
            count--
            // An object has been popped and the current queue is no longer
            // full, so wake up the thread previously blocked on put()
            // because the queue was full.
            notFull.notify()
            return x
        } // Release the mutex.
    }
}

class Item <: ToString {
    let i:Int64

    init(i:Int64) {
        this.i = i
    }

    public func toString():String {
        return "${i}"
    }
}

func checkEmptyWait() {
    let queue = BoundedQueue()
    let getter = spawn { queue.get() }
    queue.expectWaiting(false)
    queue.put(Item(17))
    try {
        Assert.equals(17, (getter.get(Duration.second * 5) as Item).getOrThrow().i, reason: "get resumes after put")
    } catch (_: TimeoutException) {
        Assert.fail(reason: "put did not wake the waiting get")
    }
}

func checkFullWait() {
    let queue = BoundedQueue()
    for (i in 0..100) {
        queue.put(Item(i))
    }
    let putter = spawn { queue.put(Item(100)) }
    queue.expectWaiting(true)
    Assert.equals(0, (queue.get() as Item).getOrThrow().i, reason: "get creates space for put")
    try {
        putter.get(Duration.second * 5)
    } catch (_: TimeoutException) {
        Assert.fail(reason: "get did not wake the waiting put")
    }
    for (i in 1..101) {
        Assert.equals(i, (queue.get() as Item).getOrThrow().i)
    }
}

main(): Int64 {
    checkEmptyWait()
    checkFullWait()

    let iters = 1000
    let queue = BoundedQueue()
    let producer = spawn {
        for (i in 0..iters) {
            queue.put(Item(i))
        }
    }
    let consumer = spawn {
        for (i in 0..iters) {
            let item = queue.get() as Item
            Assert.equals(i, item.getOrThrow().i)
        }
    }

    producer.get()
    consumer.get()
    return 0
}
