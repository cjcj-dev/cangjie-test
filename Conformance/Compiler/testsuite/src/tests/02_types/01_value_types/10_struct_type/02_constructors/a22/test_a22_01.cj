/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 02_01_10_02_a22_01

  @Level:         1

  @Assertion: 2.1.10.2(22)
              The sequence of the parameters of the primary constructor 
              must follow the parameter sequence when the function is defined.
              Non-named parameters must precede all named parameters.

  @Description: Check that the primary constructor can have all kind of parameters
                if named parameters follow unnamed parameters

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006183

*/

import utils.assert.Assert

struct RegularUnnamedBeforeRegularNamedClassNamed {
    RegularUnnamedBeforeRegularNamedClassNamed(a: Int64, b!: Int64, let c!: Int64) {
        Assert.equals(1, a)
        Assert.equals(2, b)
        Assert.equals(3, c)
    }
}

struct RegularUnnamedBeforeClassUnnamedClassNamed {
    RegularUnnamedBeforeClassUnnamedClassNamed(a: Int64, let b: Int64, var c!: Int64) {
        Assert.equals(10, a)
        Assert.equals(20, b)
        Assert.equals(30, c)
    }
}

struct RegularUnnamedBeforeClassUnnamed {
    RegularUnnamedBeforeClassUnnamed(a: Int64, let b: Int64) {
        Assert.equals(3, a)
        Assert.equals(2, b)
    }
}

struct RegularUnnamedBeforeClassNamed {
    RegularUnnamedBeforeClassNamed(a: Int64, let b!: Int64) {
        Assert.equals(1, a)
        Assert.equals(0, b)
    }
}

struct RegularNamedBeforeClassNamed {
    RegularNamedBeforeClassNamed(a!: Int64, let b!: Int64) {
        Assert.equals(-1, a)
        Assert.equals(-2, b)
    }
}

struct JustRegular {
    JustRegular(a: Int64, b!: Int64) {
        Assert.equals(-10, a)
        Assert.equals(-20, b)
    }
}

struct JustClass {
    JustClass(let a: Int64, var b!: Int64) {
        Assert.equals(5, a)
        Assert.equals(25, b)
    }
}

struct RegularUnnamed {
    RegularUnnamed(a: Int64, b: Int64) {
        Assert.equals(7, a)
        Assert.equals(17, b)
    }
}

struct RegularNamed {
    RegularNamed(a!: Int64, b!: Int64) {
        Assert.equals(-5, a)
        Assert.equals(-6, b)
    }
}

struct ClassUnnamed {
    ClassUnnamed(let a: Int64, var b: Int64) {
        Assert.equals(9, a)
        Assert.equals(10, b)
    }
}

struct ClassNamed {
    ClassNamed(let a!: Int64, var b!: Int64) {
        Assert.equals(3, a)
        Assert.equals(33, b)
    }
}

main() {
    let case1 = RegularUnnamedBeforeRegularNamedClassNamed(1, b:2 , c:3)
    let constructedValue0 = [case1]; Assert.equals(1, constructedValue0.size);

    let case2 = RegularUnnamedBeforeClassUnnamedClassNamed(10, 20, c: 30)
    let constructedValue1 = [case2]; Assert.equals(1, constructedValue1.size);

    let case3 = RegularUnnamedBeforeClassUnnamed(3, 2)
    let constructedValue2 = [case3]; Assert.equals(1, constructedValue2.size);

    var case4 = RegularUnnamedBeforeClassNamed(1, b: 0)
    let constructedValue3 = [case4]; Assert.equals(1, constructedValue3.size);

    var case5 = RegularNamedBeforeClassNamed(a: -1, b: -2)
    let constructedValue4 = [case5]; Assert.equals(1, constructedValue4.size);

    var case6 = JustRegular(-10, b: -20)
    let constructedValue5 = [case6]; Assert.equals(1, constructedValue5.size);

    var case7 = JustClass(5, b: 25)
    let constructedValue6 = [case7]; Assert.equals(1, constructedValue6.size);

    var case8 = RegularUnnamed(7, 17)
    let constructedValue7 = [case8]; Assert.equals(1, constructedValue7.size);

    var case9 = RegularNamed(a: -5, b: -6)
    let constructedValue8 = [case9]; Assert.equals(1, constructedValue8.size);

    var case10 = ClassUnnamed(9, 10)
    let constructedValue9 = [case10]; Assert.equals(1, constructedValue9.size);

    var case11 = ClassNamed(a: 3, b: 33)
    let constructedValue10 = [case11]; Assert.equals(1, constructedValue10.size);
}

