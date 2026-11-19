
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_21_a03_001

  @Level:         1

  @Assertion:   4.21(3) The coalescing operator is used for unwrapping values of Option types. Suppose the type of the
                expression e1 is Option<T>, then we have following rules about the expression e1 ?? e2.
                1.The type of the expression e2 must be T.
  @Description: Checks that using ?? with types Option<T> and T is permitted for various T.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

func present<T>(value: T): Option<T> {
    Some(value)
}

class C { 
    var x = 0
    C(y : Int64) {
        x = y
    }
}

main() {
    Assert.equals(1, present<Int8>(1) ?? Int8(1))
    Assert.equals(1, present<Int16>(1) ?? Int16(1))
    Assert.equals(1, present<Int32>(1) ?? Int32(1))
    Assert.equals(1, present<Int64>(1) ?? Int64(1))
    Assert.equals(1, present<UInt8>(1) ?? UInt8(1))
    Assert.equals(1, present<UInt16>(1) ?? UInt16(1))
    Assert.equals(1, present<UInt32>(1) ?? UInt32(1))
    Assert.equals(1, present<UInt64>(1) ?? UInt64(1))
    Assert.equals(1.0, present<Float16>(1.0) ?? Float16(1.0))
    Assert.equals(1.0, present<Float32>(1.0) ?? Float32(1.0))
    Assert.equals(1.0, present<Float64>(1.0) ?? Float64(1.0))
    Assert.equals("1", present<String>("1") ?? "1")
    Assert.equals(r'1', present<Rune>(r'1') ?? r'1')
    Assert.equals(true, present<Bool>(true) ?? true)
    Assert.isTrue(() == (present<Unit>(()) ?? ()))
    Assert.equals(2, (present<(Int8, Int8)>((1, 2)) ?? (1, 1))[1])
    Assert.equals([], present<Array<Int8>>([]) ?? Array<Int8>())
    Assert.equals(1, (present<C>(C(1)) ?? C(2)).x)
    0
}
