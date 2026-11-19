/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 02_01_10_02_a41_01

  @Level:         1

  @Assertion: 2.1.10.2(41)
              The compiler analyzes the dependency between all constructors.
              If a cyclic invoking is performed, an error is reported.

  @Description: Check that constructors can be called if they do not cause cyclic invoking

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

var order = ""

struct Test {
    init() {
        order += "_1"
    }
    
    init(x: Int64) {
        this()
        Assert.equals(1, [x].size)
        order += "_2"
    }

    init(x: Int32) {
        this(12)
        Assert.equals(1, [x].size)
        order += "_3"
    }

    init(x: Int16) {
        this(1i32)
        Assert.equals(1, [x].size)
        order += "_4"
    }

    init(x: Int8) {
        this(1i16)
        Assert.equals(1, [x].size)
        order += "_5"
    }

    init(x: Float64) {
        Assert.equals(1, [x].size)
        order += "_3"
    }

    init(x: Float32) {
        this(0.1)
        Assert.equals(1, [x].size)
        order += "_4"
    }

    init(x: Float16) {
        this(0.1f32)
        Assert.equals(1, [x].size)
        order += "_5"
    }

    init(x: Bool) {
        if (x) {
            Assert.equals(1, [Test(1i8)].size)
        } else {
            Assert.equals(1, [Test(0.1f16)].size)
        }
        order += "_6"
    }

    init(x: String) {
        this(x == "a")
        order += "_7"
    }
}

main() {
    Assert.equals(1, [Test("a")].size)
    Assert.equals("_1_2_3_4_5_6_7", order)

    order = ""
    Assert.equals(1, [Test("b")].size)
    Assert.equals("_3_4_5_6_7", order)
}