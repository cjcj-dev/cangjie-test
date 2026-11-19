/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_a04_01

  @Level:         1

  @Assertion:     5.1(4) Following the keyword func, a function name is required.

  @Description:   Check that function declaration with right syntax including required function name will not produce error.

  @Mode:          compileonly

  @Negative:      no

  @Structure:     single

*/

import utils.assert.Assert
interface myInterface { 
  func intefaceFunc1(): Int32
} 

public func checkingFunc<T>(x: T) {
  if(x is Int64){
    return "x is Int64"
  }
  return "x is not Int64"
}

open class C1 {
  public open func sayHelloWorld() {
    print("HelloWorld")
  }
}

class myClass <: myInterface {
  public var myPublicVar = "myPublicVarValue"
  private var myPivateVar:Int32 = 12
  var myVar:Float32 = 2.0
  myClass(){}

  public override func intefaceFunc1() { this.myPivateVar }

  func myClassFunc(inVal:Float32){
    this.myVar = inVal
  }
  public func getValues(){
    """
    Values are:"""
  }
  private func myPrivateFunc(){
    "private => ${myPivateVar}"
  }
  protected func myProtectedFunc(){
    "myProtectedFunc"
  }

  func checkAccess() {
    Assert.equals("private => 12", myPrivateFunc())
    Assert.equals("myProtectedFunc", myProtectedFunc())
  }
  static func myStaticFunc():Int32{
    12
  }
}
func myParentFunc(){
  func myChildFunc(){
    12
  }
  "${myChildFunc()}"
}
main() {
  let example = myClass()
  example.myClassFunc(4.0f32)
  Assert.equals(4.0f32, example.myVar)
  Assert.isTrue(example.getValues().contains("Values are:"))
  example.checkAccess()
  Assert.equals(12, myClass.myStaticFunc())
  Assert.equals("12", myParentFunc())
}
