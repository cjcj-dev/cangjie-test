/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_03_a04_01

  @Level:         1

  @Assertion: 6.1.1.3(4)
              If there is a superclass, interface names should be placed after the superclass name.

  @Description: Check that a class can inherit a superclass and implement one or more interfaces 
                if interface names are placed after the superclass name

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

open class Parent {}
open class GenericParent<T> {}

interface i1 {}
interface i2 {}
interface i3 {}

interface g1<T> {}
interface g2<T1, T2> {}
interface g3<T> {}

public interface m1 {}
interface m2<T> {}
public interface m3 {}

// simple class, simple superclass, simple interface
class SCSSSI1 <: Parent & i1 {}
class SCSSSI3 <: Parent & i1 & i2 & i3 {}

// simple class, simple superclass, generic interface
class SCSSGI1 <: Parent & g1<Bool> {}
class SCSSGI3 <: Parent & g1<Rune> & g2<String, Rune> & g3<Unit> {}

// simple class, simple superclass, modified interface
class SCSSMI1 <: Parent & m1 {}
class SCSSMI3 <: Parent & m1 & m2<Int32> & m3 {}

// simple class, simple superclass, all interfaces
class SCSSAI3 <: Parent & i1 & m1 & g1<Rune> {}
class SCSSAI9 <: Parent & i1 & i2 & i3 & g1<Bool> & g2<Rune, Rune> & g3<Unit> & m1 & m2<Object> & m3 {}

// simple class, generic superclass, simple interface
class SCGSSI1 <: GenericParent<Rune> & i1 {}
class SCGSSI3 <: GenericParent<String> & i1 & i2 & i3 {}

// simple class, generic superclass, generic interface
class SCGSGI1 <: GenericParent<Float32> & g1<Bool> {}
class SCGSGI3 <: GenericParent<Array<Int32>> & g1<Rune> & g2<String, Rune> & g3<Unit> {}

// simple class, generic superclass, modified interface
class SCGSMI1 <: GenericParent<Any> & m1 {}
class SCGSMI3 <: GenericParent<Unit> & m1 & m2<Int32> & m3 {}

// simple class, generic superclass, all interfaces
class SCGSAI3 <: GenericParent<String> & i2 & m3 & g2<Rune, Rune> {}
class SCGSAI4 <: GenericParent<Bool> & i1 & g1<Bool> & m1 & m3 {}

// generic class, simple superclass, simple interface
class GCSSSI1<T> <: Parent & i1 {}
class GCSSSI3<T> <: Parent & i1 & i2 & i3 {}

// generic class, simple superclass, generic interface
class GCSSGI1<T> <: Parent & g1<T> {}
class GCSSGI3<T> <: Parent & g1<T> & g2<T, Rune> & g3<T> {}

// generic class, simple superclass, modified interface
class GCSSMI1<T> <: Parent & m1 {}
class GCSSMI3<T> <: Parent & m1 & m2<T> & m3 {}

// generic class, simple superclass, all interfaces
class GCSSAI3<T> <: Parent & i1 & m1 & g1<T> {}
class GCSSAI5<T> <: Parent & i1 & i2 & g1<T> & g3<T> & m3 {}

// generic class, generic superclass, simple interface
class GCGSSI1<T> <: GenericParent<T> & i1 {}
class GCGSSI3<T> <: GenericParent<T> & i1 & i2 & i3 {}

// generic class, generic superclass, generic interface
class GCGSGI1<T> <: GenericParent<T> & g1<T> {}
class GCGSGI3<T> <: GenericParent<T> & g1<T> & g2<T, T> & g3<T> {}

// generic class, generic superclass, modified interface
class GCGSMI1<T> <: GenericParent<T> & m1 {}
class GCGSMI3<T> <: GenericParent<T> & m1 & m2<T> & m3 {}

// generic class, generic superclass, all interfaces
class GCGSAI3<T> <: GenericParent<T> & i1 & m1 & g1<T> {}
class GCGSAI5<T> <: GenericParent<T> & i1 & i2 & g1<T> & g3<T> & m3 {}

main() {
  // First group - implementation by a simple class with a simple superclass
  var c1 = SCSSSI1()
  let constructedValue0 = [c1]; Assert.equals(1, constructedValue0.size);
  Assert.isTrue(c1 is SCSSSI1)
  Assert.isTrue(c1 is Parent)
  Assert.isTrue(c1 is i1)

  var c2 = SCSSSI3()
  let constructedValue1 = [c2]; Assert.equals(1, constructedValue1.size);
  Assert.isTrue(c2 is SCSSSI3)
  Assert.isTrue(c2 is Parent)
  Assert.isTrue(c2 is i1)
  Assert.isTrue(c2 is i2)
  Assert.isTrue(c2 is i3)

  var c3 = SCSSGI1()
  let constructedValue2 = [c3]; Assert.equals(1, constructedValue2.size);
  Assert.isTrue(c3 is SCSSGI1)
  Assert.isTrue(c3 is Parent)
  Assert.isTrue(c3 is g1<Bool>)

  var c4 = SCSSGI3()
  let constructedValue3 = [c4]; Assert.equals(1, constructedValue3.size);
  Assert.isTrue(c4 is SCSSGI3)
  Assert.isTrue(c4 is Parent)
  Assert.isTrue(c4 is g1<Rune>)
  Assert.isTrue(c4 is g2<String, Rune>)
  Assert.isTrue(c4 is g3<Unit>)

  var c5 = SCSSMI1()
  let constructedValue4 = [c5]; Assert.equals(1, constructedValue4.size);
  Assert.isTrue(c5 is SCSSMI1)
  Assert.isTrue(c5 is Parent)
  Assert.isTrue(c5 is m1)

  var c6 = SCSSMI3()
  let constructedValue5 = [c6]; Assert.equals(1, constructedValue5.size);
  Assert.isTrue(c6 is SCSSMI3)
  Assert.isTrue(c6 is Parent)
  Assert.isTrue(c6 is m1)
  Assert.isTrue(c6 is m2<Int32>)
  Assert.isTrue(c6 is m3)

  var c7 = SCSSAI3()
  let constructedValue6 = [c7]; Assert.equals(1, constructedValue6.size);
  Assert.isTrue(c7 is SCSSAI3)
  Assert.isTrue(c7 is Parent)
  Assert.isTrue(c7 is i1)
  Assert.isTrue(c7 is g1<Rune>)
  Assert.isTrue(c7 is m1)

  var c8 = SCSSAI9()
  let constructedValue7 = [c8]; Assert.equals(1, constructedValue7.size);
  Assert.isTrue(c8 is SCSSAI9)
  Assert.isTrue(c8 is Parent)
  Assert.isTrue(c8 is i1)
  Assert.isTrue(c8 is i2)
  Assert.isTrue(c8 is i3)
  Assert.isTrue(c8 is g1<Bool>)
  Assert.isTrue(c8 is g2<Rune, Rune>)
  Assert.isTrue(c8 is g3<Unit>)
  Assert.isTrue(c8 is m1)
  Assert.isTrue(c8 is m2<Object>)
  Assert.isTrue(c8 is m3)

  // Second group - implementation by a simple class with a generic superclass
  var c9 = SCGSSI1()
  let constructedValue8 = [c9]; Assert.equals(1, constructedValue8.size);
  Assert.isTrue(c9 is SCGSSI1)
  Assert.isTrue(c9 is GenericParent<Rune>)
  Assert.isTrue(c9 is i1)

  var c10 = SCGSSI3()
  let constructedValue9 = [c10]; Assert.equals(1, constructedValue9.size);
  Assert.isTrue(c10 is SCGSSI3)
  Assert.isTrue(c10 is GenericParent<String>)
  Assert.isTrue(c10 is i1)
  Assert.isTrue(c10 is i2)
  Assert.isTrue(c10 is i3)

  var c11 = SCGSGI1()
  let constructedValue10 = [c11]; Assert.equals(1, constructedValue10.size);
  Assert.isTrue(c11 is SCGSGI1)
  Assert.isTrue(c11 is GenericParent<Float32>)
  Assert.isTrue(c11 is g1<Bool>)

  var c12 = SCGSGI3()
  let constructedValue11 = [c12]; Assert.equals(1, constructedValue11.size);
  Assert.isTrue(c12 is SCGSGI3)
  Assert.isTrue(c12 is GenericParent<Array<Int32>>)
  Assert.isTrue(c12 is g1<Rune>)
  Assert.isTrue(c12 is g2<String, Rune>)
  Assert.isTrue(c12 is g3<Unit>)

  var c13 = SCGSMI1()
  let constructedValue12 = [c13]; Assert.equals(1, constructedValue12.size);
  Assert.isTrue(c13 is SCGSMI1)
  Assert.isTrue(c13 is GenericParent<Any>)
  Assert.isTrue(c13 is m1)

  var c14 = SCGSMI3()
  let constructedValue13 = [c14]; Assert.equals(1, constructedValue13.size);
  Assert.isTrue(c14 is SCGSMI3)
  Assert.isTrue(c14 is GenericParent<Unit>)
  Assert.isTrue(c14 is m1)
  Assert.isTrue(c14 is m2<Int32>)
  Assert.isTrue(c14 is m3)

  var c15 = SCGSAI3()
  let constructedValue14 = [c15]; Assert.equals(1, constructedValue14.size);
  Assert.isTrue(c15 is SCGSAI3)
  Assert.isTrue(c15 is GenericParent<String>)
  Assert.isTrue(c15 is i2)
  Assert.isTrue(c15 is g2<Rune, Rune>)
  Assert.isTrue(c15 is m3)

  var c16 = SCGSAI4()
  let constructedValue15 = [c16]; Assert.equals(1, constructedValue15.size);
  Assert.isTrue(c16 is SCGSAI4)
  Assert.isTrue(c16 is GenericParent<Bool>)
  Assert.isTrue(c16 is i1)
  Assert.isTrue(c16 is g1<Bool>)
  Assert.isTrue(c16 is m1)
  Assert.isTrue(c16 is m3)

  // Third group - implementation by a generic class with a simple superclass
  var c17 = GCSSSI1<Rune>()
  let constructedValue16 = [c17]; Assert.equals(1, constructedValue16.size);
  Assert.isTrue(c17 is GCSSSI1<Rune>)
  Assert.isTrue(c17 is Parent)
  Assert.isTrue(c17 is i1)

  var c18 = GCSSSI3<Bool>()
  let constructedValue17 = [c18]; Assert.equals(1, constructedValue17.size);
  Assert.isTrue(c18 is GCSSSI3<Bool>)
  Assert.isTrue(c18 is Parent)
  Assert.isTrue(c18 is i1)
  Assert.isTrue(c18 is i2)
  Assert.isTrue(c18 is i3)

  var c19 = GCSSGI1<String>()
  let constructedValue18 = [c19]; Assert.equals(1, constructedValue18.size);
  Assert.isTrue(c19 is GCSSGI1<String>)
  Assert.isTrue(c19 is Parent)
  Assert.isTrue(c19 is g1<String>)

  var c20 = GCSSGI3<Int32>()
  let constructedValue19 = [c20]; Assert.equals(1, constructedValue19.size);
  Assert.isTrue(c20 is GCSSGI3<Int32>)
  Assert.isTrue(c20 is Parent)
  Assert.isTrue(c20 is g1<Int32>)
  Assert.isTrue(c20 is g2<Int32, Rune>)
  Assert.isTrue(c20 is g3<Int32>)

  var c21 = GCSSMI1<Any>()
  let constructedValue20 = [c21]; Assert.equals(1, constructedValue20.size);
  Assert.isTrue(c21 is GCSSMI1<Any>)
  Assert.isTrue(c21 is Parent)
  Assert.isTrue(c21 is m1)

  var c22 = GCSSMI3<Object>()
  let constructedValue21 = [c22]; Assert.equals(1, constructedValue21.size);
  Assert.isTrue(c22 is GCSSMI3<Object>)
  Assert.isTrue(c22 is Parent)
  Assert.isTrue(c22 is m1)
  Assert.isTrue(c22 is m2<Object>)
  Assert.isTrue(c22 is m3)

  var c23 = GCSSAI3<Float32>()
  let constructedValue22 = [c23]; Assert.equals(1, constructedValue22.size);
  Assert.isTrue(c23 is GCSSAI3<Float32>)
  Assert.isTrue(c23 is Parent)
  Assert.isTrue(c23 is i1)
  Assert.isTrue(c23 is g1<Float32>)
  Assert.isTrue(c23 is m1)

  var c24 = GCSSAI5<(Bool, Bool)>()
  let constructedValue23 = [c24]; Assert.equals(1, constructedValue23.size);
  Assert.isTrue(c24 is GCSSAI5<(Bool, Bool)>)
  Assert.isTrue(c24 is Parent)
  Assert.isTrue(c24 is i1)
  Assert.isTrue(c24 is i2)
  Assert.isTrue(c24 is g1<(Bool, Bool)>)
  Assert.isTrue(c24 is g3<(Bool, Bool)>)
  Assert.isTrue(c24 is m3)

  // Fourth group - implementation by a generic class with a generic superclass
  var c25 = GCGSSI1<Rune>()
  let constructedValue24 = [c25]; Assert.equals(1, constructedValue24.size);
  Assert.isTrue(c25 is GCGSSI1<Rune>)
  Assert.isTrue(c25 is GenericParent<Rune>)
  Assert.isTrue(c25 is i1)

  var c26 = GCGSSI3<Bool>()
  let constructedValue25 = [c26]; Assert.equals(1, constructedValue25.size);
  Assert.isTrue(c26 is GCGSSI3<Bool>)
  Assert.isTrue(c26 is GenericParent<Bool>)
  Assert.isTrue(c26 is i1)
  Assert.isTrue(c26 is i2)
  Assert.isTrue(c26 is i3)

  var c27 = GCGSGI1<String>()
  let constructedValue26 = [c27]; Assert.equals(1, constructedValue26.size);
  Assert.isTrue(c27 is GCGSGI1<String>)
  Assert.isTrue(c27 is GenericParent<String>)
  Assert.isTrue(c27 is g1<String>)

  var c28 = GCGSGI3<Int32>()
  let constructedValue27 = [c28]; Assert.equals(1, constructedValue27.size);
  Assert.isTrue(c28 is GCGSGI3<Int32>)
  Assert.isTrue(c28 is GenericParent<Int32>)
  Assert.isTrue(c28 is g1<Int32>)
  Assert.isTrue(c28 is g2<Int32, Int32>)
  Assert.isTrue(c28 is g3<Int32>)

  var c29 = GCGSMI1<Any>()
  let constructedValue28 = [c29]; Assert.equals(1, constructedValue28.size);
  Assert.isTrue(c29 is GCGSMI1<Any>)
  Assert.isTrue(c29 is GenericParent<Any>)
  Assert.isTrue(c29 is m1)

  var c30 = GCGSMI3<Object>()
  let constructedValue29 = [c30]; Assert.equals(1, constructedValue29.size);
  Assert.isTrue(c30 is GCGSMI3<Object>)
  Assert.isTrue(c30 is GenericParent<Object>)
  Assert.isTrue(c30 is m1)
  Assert.isTrue(c30 is m2<Object>)
  Assert.isTrue(c30 is m3)

  var c31 = GCGSAI3<Float32>()
  let constructedValue30 = [c31]; Assert.equals(1, constructedValue30.size);
  Assert.isTrue(c31 is GCGSAI3<Float32>)
  Assert.isTrue(c31 is GenericParent<Float32>)
  Assert.isTrue(c31 is i1)
  Assert.isTrue(c31 is g1<Float32>)
  Assert.isTrue(c31 is m1)

  var c32 = GCGSAI5<(Bool, Bool)>()
  let constructedValue31 = [c32]; Assert.equals(1, constructedValue31.size);
  Assert.isTrue(c32 is GCGSAI5<(Bool, Bool)>)
  Assert.isTrue(c32 is GenericParent<(Bool, Bool)>)
  Assert.isTrue(c32 is i1)
  Assert.isTrue(c32 is i2)
  Assert.isTrue(c32 is g1<(Bool, Bool)>)
  Assert.isTrue(c32 is g3<(Bool, Bool)>)
  Assert.isTrue(c32 is m3)
}
