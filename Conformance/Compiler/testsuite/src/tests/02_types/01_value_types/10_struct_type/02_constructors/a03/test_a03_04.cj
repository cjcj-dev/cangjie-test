/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 02_01_10_02_a03_04

  @Level:         1

  @Comment: This assertion is a part of the list with the following heading:
            A primary constructor definition includes the following:

  @Assertion: 2.1.10.2(3)
              Modifier: optional. Primary constructors can be modified with one of
              public or private, none of which are visible within the package.
              See Access Modifiers for details

  @Description: Check that structs with a constructor with any modifier can be created inside the struct.

  @Mode: run

  @Negative: no

  @Structure: single

  @Comment: There is no description on what modifiers do for primary constructors.
            This behavior is inferred from the fact that the compiler converts primary constructors into
            init constructors and the description of modifiers for init constructors

  @Issue: 0006179

*/

import utils.assert.Assert

public var constructor_counter = 0

public struct Public {
    public Public() {
        constructor_counter++
    }

    static func check_inside() {
        let t = Public()
        let constructedValue0 = [t]; Assert.equals(1, constructedValue0.size);
        Assert.equals(1, constructor_counter)
    }
}

public struct PublicGeneric<T> {
    public PublicGeneric() {
        constructor_counter++
    }

    static func check_inside() {
        let t = PublicGeneric<Float32>()
        let constructedValue1 = [t]; Assert.equals(1, constructedValue1.size);
        Assert.equals(2, constructor_counter)
    }
}

public struct PublicWithParams {
    public PublicWithParams(x: Int64) {
        constructor_counter += x
    }

    static func check_inside() {
        let t = PublicWithParams(10)
        let constructedValue2 = [t]; Assert.equals(1, constructedValue2.size);
        Assert.equals(12, constructor_counter)
    }
}

public struct Private {
    private Private() {
        constructor_counter++
    }

    static func check_inside() {
        let t = Private()
        let constructedValue3 = [t]; Assert.equals(1, constructedValue3.size);
        Assert.equals(13, constructor_counter)
    }
}

public struct PrivateGeneric<T> {
    private PrivateGeneric() {
        constructor_counter++
    }

    static func check_inside() {
        let t = PrivateGeneric<Rune>()
        let constructedValue4 = [t]; Assert.equals(1, constructedValue4.size);
        Assert.equals(14, constructor_counter)
    }
}

public struct PrivateWithParams {
    private PrivateWithParams(x: Int64) {
        constructor_counter += x
    }

    static func check_inside() {
        let t = PrivateWithParams(14)
        let constructedValue5 = [t]; Assert.equals(1, constructedValue5.size);
        Assert.equals(28, constructor_counter)
    }
}

public struct NoMods {
    NoMods() {
        constructor_counter++
    }

    static func check_inside() {
        let t = NoMods()
        let constructedValue6 = [t]; Assert.equals(1, constructedValue6.size);
        Assert.equals(29, constructor_counter)
    }
}

public struct NoModsGeneric<T> {
    NoModsGeneric() {
        constructor_counter++
    }

    static func check_inside() {
        let t = NoModsGeneric<Unit>()
        let constructedValue7 = [t]; Assert.equals(1, constructedValue7.size);
        Assert.equals(30, constructor_counter)
    }
}

public struct NoModsWithParams {
    NoModsWithParams(x: Int64) {
        constructor_counter += x
    }

    static func check_inside() {
        let t = NoModsWithParams(70)
        let constructedValue8 = [t]; Assert.equals(1, constructedValue8.size);
        Assert.equals(100, constructor_counter)
    }
}

main() {
    Assert.equals(0, constructor_counter)

    Public.check_inside()

    PublicGeneric<Int32>.check_inside()

    PublicWithParams.check_inside()

    Private.check_inside()

    PrivateGeneric<Bool>.check_inside()

    PrivateWithParams.check_inside()

    NoMods.check_inside()

    NoModsGeneric<String>.check_inside()

    NoModsWithParams.check_inside()
}
