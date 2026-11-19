/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_a01_001

  @Level:         1

  @Assertion: 4(1): An expression can consist of one or more operands, acted on
              by zero or more operators.
  @Description: Checks that an expression can consist of one operand.
  @Mode: run
  @Negative: no
  @Structure: single

*/

import utils.assert.Assert

var i: Int64   = Assert.getRuntimeZero()
let b: Bool    = Assert.getRuntimeZero() == 0
let f: Float64 = 3.14
let c: Rune    = r'c'

let str   : String        = "Hello"
let arrI8 : Array<UInt8>  = [72, 101, 108, 108, 111]
let arrStr: Array<String> = ["This", "is", "me"]

func simpleFunction() {}

func getTuple(i: Int64, j: Int64) {
    (i, j)
}

main() {
    let unused = 15
    let unused1 = i
    let unused2 = 0u8 
    let unused3 = 4i32 
    
    let unused4 = 3.14
    let unused5 = f

    let unused6 = r'c'
    let unused7 = c

    let unused8 = true
    let unused9 = false
    Assert.isTrue(b)

    let unused10 = "Hello" 
    Assert.equals("Hello", str)

    let unused12 = [0, 1, 2, 3, 4] 
    let unused13 = ["This", "is", "me"]
    Assert.equals(72u8, arrI8[0])
    Assert.equals("This", arrStr[0])

    let unused14 = ()
    let unused15 = (0, "tuple", true) 
    Assert.equals(15, unused)
    Assert.equals(0, unused1)
    Assert.equals(0u8, unused2)
    Assert.equals(4i32, unused3)
    Assert.equals(3.14, unused4)
    Assert.equals(3.14, unused5)
    Assert.equals(r'c', unused6)
    Assert.equals(r'c', unused7)
    Assert.isTrue(unused8)
    Assert.isFalse(unused9)
    Assert.equals("Hello", unused10)
    Assert.equals(4, unused12[4])
    Assert.equals("me", unused13[2])
    Assert.equals((), unused14)
    Assert.equals(0, unused15[0])
    Assert.equals("tuple", unused15[1])
    Assert.isTrue(unused15[2])
    Assert.equals(1, getTuple(1, 0)[0])

    simpleFunction
    simpleFunction()
    getTuple
    getTuple(0, 0)

    return
}
