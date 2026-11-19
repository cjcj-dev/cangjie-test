/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_02_a05_01

  @Level:         1

  @Assertion:   10.2(5)  The syntax for defining an operator function:
                operatorFunctionDefinition
                     : functionModifierList? 'operator' 'func'
                       overloadedOperators typeParameters?
                       functionParameters (':' type)?
                      (genericConstraints)? ('=' expression | block)?
                 
  @Description:  Syntax variations of operator func

  @Mode:         compileonly

  @Negative:     no

  @Structure:    single

  @Comment:


*/

import utils.assert.Assert



class IRange {
    var lower : Int64;
    var upper : Int64;
    var value : Int64;

    init(l: Int64, u:Int64, v:Int64) {
        this.lower = l
        this.upper = u
        this.value = v
    }


    private operator func + (Right:Int64):Int64 {
        var cur : Int64 = this.value + Right;
        return cur;
    }

    public operator func + (Right:IRange):IRange {
        Assert.equals(1, [Right].size)
        IRange(0,0,0)
    }
    private  operator func - (Right:Float64):Float64 {
        Assert.equals(1, [Right].size)
        var cur : Float64 = 0.0
        return cur;
    }

    func checkPrivateOperators() {
        Assert.equals(7, this + 3)
        Assert.equals(0.0, this - 1.0)
    }
}


main(ina :Array<String>) {
    Assert.equals(1, [ina].size)
    let x = IRange(0, 10, 4)
    x.checkPrivateOperators()
    Assert.equals(0, (x + x).value)
    0
}