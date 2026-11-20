/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_02_01_a11_01

  @Level:         1

  @Assertion:    3.2.1(11) If the block does not contain any expression or statement, the value of the block is ():
                            { } // The value of this empty block is ().

  @Description:  Check that the value of an empty block is ().

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

//  Function body is an empty block
func foo01(_: Int64) { }

main() {

//  Test-case 1:  check that the value of an empty function body is ()

    var res = foo01(0)
    Assert.equals((), res)

//  Test-case 2:  check that the value of an empty if_block is ()

    let x02 = 100
    var ifRes : Unit = if (x02 > 0) { }
    Assert.equals((), ifRes)

//  Test-case 3: check that the value of an empty for_in_loop block is ()

    let evenRange03 = 10..=20:2    
    var forInRes : Unit = for (value in evenRange03 ) { }
    Assert.equals((), forInRes)

//  Test-case 4: check that if the block doesn't contain any expression, the value of the block is () 

    var blockRes04 : Unit = {_: Int64, _: Int64 => var _: Int64 = 7; let _: Int64 = 10; var _: Int64 = 50} (1, 5)
    Assert.equals((), blockRes04)

//  Test-case 5: check that if the block of lambda is empty, the value of the block is () 

    var blockRes05 : Unit = {_: Int64 => } (1)
    Assert.equals((), blockRes05)

}   //main

