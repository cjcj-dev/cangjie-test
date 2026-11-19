/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_02_a09_01

  @Level:         1

  @Assertion:    1.2(9) In the call expression, a newline character cannot be used as a separator
                        between ( and the token before it.

  @Description:  No newline character as a separator between ( and the token before it.

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert
open class Base {}
class Sub <: Base {}

main() {
    // test case #1
    func f1() : Int32 {
	    return 0
	}
    Assert.equals(0, f1())
    
    // test case #2
    func f2(a : Int32) : String {
	    return a.toString()
	}
    Assert.equals("2", f2(2))
    
    // test case #3
    func f3<x, y, z> (a : x, b : y, c : z)  : Float64 {
	    let first: Any = a
        let second: Any = b
        let third: Any = c
        Assert.isTrue(first is Int64)
        Assert.isTrue(second is String)
        Assert.isTrue(third is Float64)
        return 1.0
	}
    Assert.equals(1.0, f3(1, "arg", 1.0))
    
    // test case #4
    func f4<x>(a : Base, b : x)  : String {
	    let first: Any = a
        let second: Any = b
        Assert.isTrue(first is Base)
        Assert.isTrue(second is Sub)
        return "test_case_#4"
	}
    Assert.equals("test_case_#4", f4(Base(), Sub()))
    f4<Base>(Base(), Sub())
    Assert.equals("test_case_#4", f4<Base>(Base(), Sub()))
    
    // test case #5
    func f5(a: Int32, b: Int32): (Int32, Int32) { (a, b) }
    let v : (Int32, Int32) = f5(1, 2)
    Assert.equals(1i32, v[0])
    Assert.equals(2i32, v[1])
    
    // test case #6
    func add(a: Int32, b: Int32): Int32 {
	    a + b
	}
    func f6(add: (Int32, Int32) -> Int32, a: Int32, b: Int32): Unit {
	    print("${add(a, b)}")
    }
    var s = f6(add, 10, 20)
    Assert.equals((), s)
}
