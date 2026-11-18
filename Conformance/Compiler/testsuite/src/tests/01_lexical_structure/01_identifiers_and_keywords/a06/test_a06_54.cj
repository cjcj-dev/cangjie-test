/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            01_01_a06_54

  @Level:         1

  @Assertion:       1.1(6) The syntax of Identifier is defined as:
                       identifier
                           : Identifier
                           | PUBLIC
                           | PRIVATE
                           | PROTECTED
                           | OVERRIDE
                           | ABSTRACT
                      | SEALED
                           | OPEN
                           | REDEF
                           | GET
                           | SET
                           ;
                       Identifier
                           : '_'* Letter (Letter | '_' | DecimalDigit)*
                           | '`' '_'* Letter (Letter | '_' | DecimalDigit)* '`'
                           ;
                       Letter
                           : [a-zA-Z]
                           ;
                       DecimalDigit
                           : [0-9]
                           ;

  @Description:     Check that identifiers can start with _.

  @Mode:            compileonly
  @Negative:        no
  @Structure:       single
*/

import utils.assert.Assert

main() {
    let _aa = 0
    let _a_ = 0
    let _a1 = 0
    let _aBC = 0
    let _ah_ = 0
    let _ah5 = 0
    let _a_p = 0
    let _a__ = 0
    let _a_0 = 0
    let _a6a = 0
    let _a6_ = 0
    let _a60 = 0

    let __aa = 0
    let __a_ = 0
    let __a1 = 0
    let __aBC = 0
    let __ah_ = 0
    let __ah5 = 0
    let __a_p = 0
    let __a__ = 0
    let __a_0 = 0
    let __a6a = 0
    let __a6_ = 0
    let __a60 = 0

    let `_aaa` = 0
    let `_aa_` = 0
    let `_aa1` = 0
    let `_aaBC` = 0
    let `_aah_` = 0
    let `_aah5` = 0
    let `_aa_p` = 0
    let `_aa__` = 0
    let `_aa_0` = 0
    let `_aa6a` = 0
    let `_aa6_` = 0
    let `_aa60` = 0

    let `__aaa` = 0
    let `__aa_` = 0
    let `__aa1` = 0
    let `__aaBC` = 0
    let `__aah_` = 0
    let `__aah5` = 0
    let `__aa_p` = 0
    let `__aa__` = 0
    let `__aa_0` = 0
    let `__aa6a` = 0
    let `__aa6_` = 0
    let `__aa60` = 0

    Assert.equals(0, _aa)
    Assert.equals(0, _a_)
    Assert.equals(0, _a1)
    Assert.equals(0, _aBC)
    Assert.equals(0, _ah_)
    Assert.equals(0, _ah5)
    Assert.equals(0, _a_p)
    Assert.equals(0, _a__)
    Assert.equals(0, _a_0)
    Assert.equals(0, _a6a)
    Assert.equals(0, _a6_)
    Assert.equals(0, _a60)
    Assert.equals(0, __aa)
    Assert.equals(0, __a_)
    Assert.equals(0, __a1)
    Assert.equals(0, __aBC)
    Assert.equals(0, __ah_)
    Assert.equals(0, __ah5)
    Assert.equals(0, __a_p)
    Assert.equals(0, __a__)
    Assert.equals(0, __a_0)
    Assert.equals(0, __a6a)
    Assert.equals(0, __a6_)
    Assert.equals(0, __a60)
    Assert.equals(0, `_aaa`)
    Assert.equals(0, `_aa_`)
    Assert.equals(0, `_aa1`)
    Assert.equals(0, `_aaBC`)
    Assert.equals(0, `_aah_`)
    Assert.equals(0, `_aah5`)
    Assert.equals(0, `_aa_p`)
    Assert.equals(0, `_aa__`)
    Assert.equals(0, `_aa_0`)
    Assert.equals(0, `_aa6a`)
    Assert.equals(0, `_aa6_`)
    Assert.equals(0, `_aa60`)
    Assert.equals(0, `__aaa`)
    Assert.equals(0, `__aa_`)
    Assert.equals(0, `__aa1`)
    Assert.equals(0, `__aaBC`)
    Assert.equals(0, `__aah_`)
    Assert.equals(0, `__aah5`)
    Assert.equals(0, `__aa_p`)
    Assert.equals(0, `__aa__`)
    Assert.equals(0, `__aa_0`)
    Assert.equals(0, `__aa6a`)
    Assert.equals(0, `__aa6_`)
    Assert.equals(0, `__aa60`)
}
