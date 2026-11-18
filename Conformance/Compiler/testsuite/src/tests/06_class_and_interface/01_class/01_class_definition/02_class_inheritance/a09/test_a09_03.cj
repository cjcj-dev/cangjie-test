/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_02_a09_03

  @Level:         1

  @Assertion: 6.1.1.2(9)
              If a super class is not defined explicitly, the super class is Object by default.

  @Description: Check that classes without inheritance can satisfy generic constraint <: Object

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006084

*/

import utils.assert.Assert

public interface I {}

class InheritedFromObject<T> where T <: Object {}

class A {}
class B <: I {}
class C<T1, T2, T3> {}

public class D {}
public class E <: I {}
public class F<T> {}

open class G {}
open class H <: I {}
open class J<U, V> {}

sealed abstract class K {}
sealed abstract class L <: I {}
sealed abstract class M<T> {}

abstract class N {}
abstract class O <: I {}
abstract class P<T> {}

main() {
  // Classes without modifiers
  var a = InheritedFromObject<A>()
  let constructedValue0 = [a]; Assert.equals(1, constructedValue0.size);
  Assert.isTrue(a is InheritedFromObject<A>)
  var b = InheritedFromObject<B>()
  let constructedValue1 = [b]; Assert.equals(1, constructedValue1.size);
  Assert.isTrue(b is InheritedFromObject<B>)
  var c = InheritedFromObject<C<Float32, Float32, Float32>>()
  let constructedValue2 = [c]; Assert.equals(1, constructedValue2.size);
  Assert.isTrue(c is InheritedFromObject<C<Float32, Float32, Float32>>)

  // Public classes
  var d = InheritedFromObject<D>()
  let constructedValue3 = [d]; Assert.equals(1, constructedValue3.size);
  Assert.isTrue(d is InheritedFromObject<D>)
  var e = InheritedFromObject<E>()
  let constructedValue4 = [e]; Assert.equals(1, constructedValue4.size);
  Assert.isTrue(e is InheritedFromObject<E>)
  var f = InheritedFromObject<F<Rune>>()
  let constructedValue5 = [f]; Assert.equals(1, constructedValue5.size);
  Assert.isTrue(f is InheritedFromObject<F<Rune>>)

  // Open classes
  var g = InheritedFromObject<G>()
  let constructedValue6 = [g]; Assert.equals(1, constructedValue6.size);
  Assert.isTrue(g is InheritedFromObject<G>)
  var h = InheritedFromObject<H>()
  let constructedValue7 = [h]; Assert.equals(1, constructedValue7.size);
  Assert.isTrue(h is InheritedFromObject<H>)
  var j = InheritedFromObject<J<Rune, (Int32, Int32)>>()
  let constructedValue8 = [j]; Assert.equals(1, constructedValue8.size);
  Assert.isTrue(j is InheritedFromObject<J<Rune, (Int32, Int32)>>)

  // Sealed classes
  var k = InheritedFromObject<K>()
  let constructedValue9 = [k]; Assert.equals(1, constructedValue9.size);
  Assert.isTrue(k is InheritedFromObject<K>)
  var l = InheritedFromObject<L>()
  let constructedValue10 = [l]; Assert.equals(1, constructedValue10.size);
  Assert.isTrue(l is InheritedFromObject<L>)
  var m = InheritedFromObject<M<() -> Int32>>()
  let constructedValue11 = [m]; Assert.equals(1, constructedValue11.size);
  Assert.isTrue(m is InheritedFromObject<M<() -> Int32>>)

  // Abstract classes
  var n = InheritedFromObject<N>()
  let constructedValue12 = [n]; Assert.equals(1, constructedValue12.size);
  Assert.isTrue(n is InheritedFromObject<N>)
  var o = InheritedFromObject<O>()
  let constructedValue13 = [o]; Assert.equals(1, constructedValue13.size);
  Assert.isTrue(o is InheritedFromObject<O>)
  var p = InheritedFromObject<P<Int16>>()
  let constructedValue14 = [p]; Assert.equals(1, constructedValue14.size);
  Assert.isTrue(p is InheritedFromObject<P<Int16>>)
}
