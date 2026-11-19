/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        A_02_03_03_a01_01

  @Level:         1
  @Assertion:   A.2.3.3(1) 
                functionDefinition
                    :(functionModifierList NL*)? FUNC
                    NL* identifier
                    (NL* typeParameters NL*)?
                    NL* functionParameters
                    (NL* COLON NL* type)?
                    (NL* genericConstraints)?
                    (NL* block)?
                    ;
                operatorFunctionDefinition
                    : (functionModifierList NL*)? OPERATOR NL* FUNC
                    NL* overloadedOperators
                    (NL* typeParameters NL*)?
                    NL* functionParameters
                    (NL* COLON NL* type)?
                    (NL* genericConstraints)?
                    (NL* block)?
                    ;

                functionParameters
                    : (LPAREN (NL* unnamedParameterList ( NL* COMMA NL* namedParameterList)? )?
                        NL* RPAREN NL*)
                    | (LPAREN NL* (namedParameterList NL*)? RPAREN NL*)
                    ;

                nondefaultParameterList
                    : unnamedParameter (NL* COMMA NL* unnamedParameter)*
                        (NL* COMMA NL* namedParameter)*
                    | namedParameter (NL* COMMA NL* namedParameter)*
                    ;

                unnamedParameterList
                    : unnamedParameter (NL* COMMA NL* unnamedParameter)*
                    ;

                unnamedParameter
                    : (identifier | WILDCARD) NL* COLON NL* type
                    ;

                namedParameterList
                    : (namedParameter | defaultParameter)
                    (NL* COMMA NL* (namedParameter | defaultParameter))*
                    ;
                namedParameter
                    : identifier NL* NOT NL* COLON NL* type
                    ;
                defaultParameter
                    : identifier NL* NOT NL* COLON NL* type NL* ASSIGN NL* expression
                    ;

                functionModifierList
                    : (functionModifier NL*)+
                    ;
                functionModifier
                    : PUBLIC
                    | PRIVATE
                    | PROTECTED
                    | STATIC
                    | OPEN
                    | OVERRIDE
                    | OPERATOR
                    | REDEF
                    | MUT
                    | UNSAFE
                    ;

  @Description: Check trivial function declaration.
                Reference to other tests in additional_tests.txt.
  @Mode:        compileOnly
  @Negative:    no
  @Structure:   single
*/

import utils.assert.Assert

func f6():Int64 {
    123_i64
}

open class myClass {
    public open func f1() {}
    protected func f2(a: Bool): Bool { !a }
    private func f3(b!:Int32) { Assert.equals(12i32, b) }
    static func f4(c!:Float64 = 1.0/3.0) { Assert.approxEquals(1.0/3.0, c) }
    private operator func * (Right:Float64):Float64 {
        Assert.approxEquals(2.0, Right)
        0.1
    }
    func checkMembers() {
        Assert.isTrue(f2(false))
        f3(b: 12i32)
        f4()
        Assert.approxEquals(0.1, this * 2.0)
    }
}

open class myClass2 <: myClass {
    public open func f5(d: Rune, e!:Range<Int64>, f!:(Float32, Float32)) {
        Assert.equals(r'a', d)
        Assert.equals(1..3, e)
        Assert.approxEquals(1.0f32, f[0])
        Assert.approxEquals(2.0f32, f[1])
    }
    override public func f1() {
        let sum = 2 + 2
        Assert.equals(4, sum)
        return
    }
}

main() {
    Assert.equals(123, f6())
    let sample = myClass2()
    sample.checkMembers()
    sample.f1()
    sample.f5(r'a', e: 1..3, f: (1.0f32, 2.0f32))
    return 0
}