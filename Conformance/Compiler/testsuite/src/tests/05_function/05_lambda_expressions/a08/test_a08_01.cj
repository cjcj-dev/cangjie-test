/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_05_a08_01

  @Level:         1

  @Assertion:       5.5(8) The following is an example in which the Unit return type is specified: 
                    func Column(c: (Data) -> Unit) {...} 
                    func Row(r: (Data) -> Unit) {...} 
                    func Build():Unit { 
                        Column { 
                            Row { 
                                BuildDetail() 
                                BuildCalendar() 
                            } // OK. Well typed since 'return' is inserted. 
                            width(750) 
                            height(700) 
                            backgroundColor("#ff41444b") 
                        }  // OK. Well typed since 'return' is inserted. 
                    } 

  @Description:     Positive examples from spec

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/
import utils.assert.Assert

func BuildDetail() {}
func BuildCalendar() {}
func width(a: Int32) { let observedArgument0 = [a]; Assert.equals(1, observedArgument0.size);}
func height(a: Int32) { let observedArgument0 = [a]; Assert.equals(1, observedArgument0.size);}
func backgroundColor(a: String) { let observedArgument0 = [a]; Assert.equals(1, observedArgument0.size);

}

func Column(c: () -> Unit) { let observedArgument0 = [c]; Assert.equals(1, observedArgument0.size);}
func Row(r: () -> Unit) { let observedArgument0 = [r]; Assert.equals(1, observedArgument0.size);}
func Build():Unit { 
    Column { 
        Row { 
            BuildDetail() 
            BuildCalendar() 
        } // OK. Well typed since 'return' is inserted. 
        width(750) 
        height(700) 
        backgroundColor("#ff41444b") 
    }  // OK. Well typed since 'return' is inserted. 
} 

main() {
    Assert.isTrue(Column is (() -> Unit) -> Unit)
    Assert.isTrue(Row is (() -> Unit) -> Unit)
    Assert.isTrue(Build is () -> Unit)
}
