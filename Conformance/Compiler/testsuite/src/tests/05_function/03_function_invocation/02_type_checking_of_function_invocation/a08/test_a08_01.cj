/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_03_02_a08_01

  @Level:         1

  @Comment:         Assume that the function is defined as: 
                        𝑓𝑖 < 𝑇𝑖1 , ..., 𝑇𝑖𝑝 > (𝐴𝑖1 , ..., 𝐴𝑖𝑘 ) ∶ 𝑅𝑖 𝑤ℎ𝑒𝑟𝑒 𝐶𝑖1 , ..., 𝐶𝑖𝑞𝑖

  @Assertion:       5.3.2(8)  b) If `fi` is a generic function, check the type according to the following rules: 
                        i. Parameter type check: there is substitution exists so that argument type `(A1, ...,Ak)` 
                            is the subtype of the type after the parameter type  is replaced substituted. 
                                𝜎 = [𝑇1 ↦ 𝑇𝑖1 , ..., 𝑇𝑝 ↦ 𝑇𝑖𝑝]Δ ⊢ (𝐴1, ..., 𝐴𝑘) <∶ 𝜎(𝐴𝑖1 , ..., 𝐴𝑖𝑘 ) 
                        ii. Check the type of the return type: If the context of the calling expression has a specific 
                            type requirement R. Replace i) with the return type Ri of the function fi, the return type 
                            after substitution is a subtype of R. 
                                𝜎 = [𝑇1 ↦ 𝑇𝑖1 , ..., 𝑇𝑝 ↦ 𝑇𝑖𝑝]Δ ⊢ 𝜎𝑅𝑖 <∶ 𝑅 

  @Description:     Check that if invoked generic function with arguments types as subtypes of parameters types 
                    and return value type is subtype of specific type requirement R from context - no error will be 
                    raised. 

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/
import utils.assert.Assert

type myTypeInt32 = Int32
type myTypeBool = Bool

extend myTypeInt32 {
    func doubled() {
        this * 2
    }
}

class myClass {
    func f0<T>(a: T): T { a }
    func f1<T1, T2>(a: T1, b: T2): String where T1 <: ToString, T2 <: ToString {"${b} ${a}"}
}

struct myStruct {
    func f0<T>(a: T): T { a }
    func f1<T1, T2>(a: T1, b: T2): String where T1 <: ToString, T2 <: ToString {"${b} ${a}"}
}

enum myEnum {
    H

    func f0<T>(a: T): T { a }
    func f1<T1, T2>(a: T1, b: T2): String where T1 <: ToString, T2 <: ToString {"${b} ${a}"}
}

func f0<T>(a: T): T { a }
func f1<T1, T2>(a: T1, b: T2): String where T1 <: ToString, T2 <: ToString {"${b} ${a}"}

main() {
    var myInt32Var: Int32 = 12
    var myTypeInt32Var: myTypeInt32 = 3
    Assert.equals(6, myTypeInt32Var.doubled())
    var myCharVar: Rune = 'c'
    var myTypeBoolVar: myTypeBool = true

    Assert.isTrue(myInt32Var is Int32)
    Assert.isTrue(myTypeInt32Var is Int32)
    Assert.isTrue(myTypeInt32Var is myTypeInt32)
    Assert.isTrue(f0<Int32> is (Int32) -> Int32)
    Assert.isTrue(f0<Int32> is (myTypeInt32) -> Int32)
    Assert.isTrue(f0<Int32> is (myTypeInt32) -> myTypeInt32)
    Assert.isTrue(f0<Int32> is (Int32) -> myTypeInt32)
    Assert.isTrue(f0<Int32>(myInt32Var) is myTypeInt32)
    Assert.isTrue(f0<Int32>(myInt32Var) is Int32)
    Assert.equals(12, f0(myInt32Var))

    Assert.isTrue(myCharVar is Rune)
    Assert.isTrue(myTypeBoolVar is Bool)
    Assert.isTrue(myTypeBoolVar is myTypeBool)
    Assert.isTrue(f1<Rune, Bool> is (Rune, Bool) -> String)
    Assert.isTrue(f1<Rune, myTypeBool> is (Rune, Bool) -> String)
    Assert.isTrue(f1<Rune, Bool> is (Rune, myTypeBool) -> String)
    Assert.isTrue(f1<Rune, Bool>(myCharVar, myTypeBoolVar) is String)
    Assert.isTrue(f1<Rune, myTypeBool>(myCharVar, myTypeBoolVar) is String)
    Assert.equals("true c", f1<Rune, Bool>(myCharVar, myTypeBoolVar))

    var myClassImpl = myClass()
    Assert.isTrue(myClassImpl.f0<Int32> is (Int32) -> Int32)
    Assert.isTrue(myClassImpl.f0<Int32> is (myTypeInt32) -> Int32)
    Assert.isTrue(myClassImpl.f0<Int32> is (myTypeInt32) -> myTypeInt32)
    Assert.isTrue(myClassImpl.f0<Int32> is (Int32) -> myTypeInt32)
    Assert.isTrue(myClassImpl.f0<Int32>(myInt32Var) is myTypeInt32)
    Assert.isTrue(myClassImpl.f0<Int32>(myInt32Var) is Int32)
    Assert.equals(12, myClassImpl.f0(myInt32Var))

    Assert.isTrue(myClassImpl.f1<Rune, Bool> is (Rune, Bool) -> String)
    Assert.isTrue(myClassImpl.f1<Rune, myTypeBool> is (Rune, Bool) -> String)
    Assert.isTrue(myClassImpl.f1<Rune, Bool> is (Rune, myTypeBool) -> String)
    Assert.isTrue(myClassImpl.f1<Rune, Bool>(myCharVar, myTypeBoolVar) is String)
    Assert.isTrue(myClassImpl.f1<Rune, myTypeBool>(myCharVar, myTypeBoolVar) is String)
    Assert.equals("true c", myClassImpl.f1<Rune, Bool>(myCharVar, myTypeBoolVar))

    var myStructImpl = myStruct()
    Assert.isTrue(myStructImpl.f0<Int32> is (Int32) -> Int32)
    Assert.isTrue(myStructImpl.f0<Int32> is (myTypeInt32) -> Int32)
    Assert.isTrue(myStructImpl.f0<Int32> is (myTypeInt32) -> myTypeInt32)
    Assert.isTrue(myStructImpl.f0<Int32> is (Int32) -> myTypeInt32)
    Assert.isTrue(myStructImpl.f0<Int32>(myInt32Var) is myTypeInt32)
    Assert.isTrue(myStructImpl.f0<Int32>(myInt32Var) is Int32)
    Assert.equals(12, myStructImpl.f0(myInt32Var))

    Assert.isTrue(myStructImpl.f1<Rune, Bool> is (Rune, Bool) -> String)
    Assert.isTrue(myStructImpl.f1<Rune, myTypeBool> is (Rune, Bool) -> String)
    Assert.isTrue(myStructImpl.f1<Rune, Bool> is (Rune, myTypeBool) -> String)
    Assert.isTrue(myStructImpl.f1<Rune, Bool>(myCharVar, myTypeBoolVar) is String)
    Assert.isTrue(myStructImpl.f1<Rune, myTypeBool>(myCharVar, myTypeBoolVar) is String)
    Assert.equals("true c", myStructImpl.f1<Rune, Bool>(myCharVar, myTypeBoolVar))

    Assert.isTrue(myEnum.H.f0<Int32> is (Int32) -> Int32)
    Assert.isTrue(myEnum.H.f0<Int32> is (myTypeInt32) -> Int32)
    Assert.isTrue(myEnum.H.f0<Int32> is (myTypeInt32) -> myTypeInt32)
    Assert.isTrue(myEnum.H.f0<Int32> is (Int32) -> myTypeInt32)
    Assert.isTrue(myEnum.H.f0<Int32>(myInt32Var) is myTypeInt32)
    Assert.isTrue(myEnum.H.f0<Int32>(myInt32Var) is Int32)
    Assert.equals(12, myEnum.H.f0(myInt32Var))

    Assert.isTrue(myEnum.H.f1<Rune, Bool> is (Rune, Bool) -> String)
    Assert.isTrue(myEnum.H.f1<Rune, myTypeBool> is (Rune, Bool) -> String)
    Assert.isTrue(myEnum.H.f1<Rune, Bool> is (Rune, myTypeBool) -> String)
    Assert.isTrue(myEnum.H.f1<Rune, Bool>(myCharVar, myTypeBoolVar) is String)
    Assert.isTrue(myEnum.H.f1<Rune, myTypeBool>(myCharVar, myTypeBoolVar) is String)
    Assert.equals("true c", myEnum.H.f1<Rune, Bool>(myCharVar, myTypeBoolVar))

}
