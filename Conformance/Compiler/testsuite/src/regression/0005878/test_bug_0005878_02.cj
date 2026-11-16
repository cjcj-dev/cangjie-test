/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        bug_0005878_02

  @Assertion:   0005878: Hexadecimal representation, a floating point number computes wrong.              
                  
  @Description: Error demo: float hex representation folded incorrectly

  @Mode:        run

  @Negative:    no

  @Structure:   single

*/
import utils.assert.Assert
main() {
   // Hexadecimal fractional digits: .1 = 1/16, .4 = 4/16; p scales by powers of two.
   print(0x.1p1); print(" must be: "); println(0.0625*2.0)
   print(0x.4p-1);print(" must be: "); println(0.25*0.5)


}
