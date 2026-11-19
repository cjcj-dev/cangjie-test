/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         bug_0006214

  @Assertion:    10.1.1(3) 2.Static member functions and instance member functions 
                 of extends of the same type cannot be overloaded with each other, 
                 except that two functions in extensions of the same type both are private

  @Description: Compiler contradicts to assert and emit error
                and instance member in class
                Example taken from    Cangjie Language Specification
                Version 0.22.14pp 201-202

  @Mode:         compileonly

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert



open class Klass {
    
    func Check(arg:Int8) {
        Assert.equals(4i8, arg)
    }

}
extend Klass {
    private func h() {}
    func checkInstanceExtension() { h() }
}
extend Klass {
    private static func h(a: Int64) { Assert.equals(12, a) } // OK
    static func checkStaticExtension() { h(12) }
}
main(ina :Array<String>) {
    Assert.equals(1, [ina].size)
    var kl:Klass;
    kl = Klass()
    kl.Check(4i8)
    kl.checkInstanceExtension()
    Klass.checkStaticExtension()
    0
}
