/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_07_a07_01

  @Level:         1

  @Assertion: 9.7(7) When building a candidate set for function calls, pay attention to the following points for 
              generic functions:

              If no type arguments are provided during function invoking, that is, the function invoking format is
              f(a), the generic function f is a candidate when:

              If f is a generic function in the form of f<X_1, ...,X_m>(p1: T_1, ..., pn: T_n): R, the calling
              expression does not provide type arguments, and the form is f(a_1, ..., a_n). If f can infer a group of
              type arguments TA_1,...,TA_m for the call, and  

              - Once the inferred type arguments TA_1, ...,TA_m are substituted for the function type parameter
                (T1, ..., Tn) of f, the constructed types in the parameter of f is applicable with respect to A. 
                   𝜎 = [𝑋1 ↦ 𝑇𝐴1 , ..., 𝑋m ↦ 𝑇𝐴m ]Δ ⊢ (𝐴1, ..., 𝐴𝑛) <∶ 𝜎(𝑇1, ..., 𝑇n) 
                   
              - If the return type RA is provided in the calling expression. The constructed type in the return type
                of f is a subtype of RA. 
                     𝜎 = [𝑋   ↦ 𝑇 𝐴  , ..., 𝑋 ↦ 𝑇 𝐴  ]Δ ⊢ 𝜎𝑅 <∶ 𝑅𝐴

  @Description: Check generic function overloading with inferred type arguments.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

open class A {}
open class B <: A {}
open class C <: B {}

func foo<T>(x: T) where T <: A { let observedArgument0 = [x]; Assert.equals(1, observedArgument0.size);
    return 1
}

func foo(x: C) { let observedArgument0 = [x]; Assert.equals(1, observedArgument0.size);
    return 2
}

main() {
    Assert.equals(1, foo(A()))
    Assert.equals(1, foo(B()))
    Assert.equals(2, foo(C()))
}

