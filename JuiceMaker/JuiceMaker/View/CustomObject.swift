//
//  Custom.swift
//  JuiceMaker
//
//  Created by 박재우 on 2023/01/12.
//

import UIKit

protocol FruitObject {
    var fruit: Fruits { get }
}

protocol MenuObject {
    var juice: Menu { get }
}

class StrawberryLabel: UILabel, FruitObject {
    var fruit: Fruits = .strawberry
}

class BananaLabel: UILabel, FruitObject {
    var fruit: Fruits = .banana
}

class PineappleLabel: UILabel, FruitObject {
    var fruit: Fruits = .pineapple
}

class KiwiLabel: UILabel, FruitObject {
    var fruit: Fruits = .kiwi
}

class MangoLabel: UILabel, FruitObject {
    var fruit: Fruits = .mango
}

class StrawberryBananaButton: UIButton, MenuObject {
    var juice: Menu = .strawberryBananaJuice
}

class StrawberryButton: UIButton, MenuObject {
    var juice: Menu = .strawberryJuice
}

class BananaButton: UIButton, MenuObject {
    var juice: Menu = .bananaJuice
}

class PineappleButton: UIButton, MenuObject {
    var juice: Menu = .pineappleJuice
}

class MangoKiwiButton: UIButton, MenuObject {
    var juice: Menu = .mangoKiwiJuice
}

class KiwiButton: UIButton, MenuObject {
    var juice: Menu = .kiwiJuice
}

class MangoButton: UIButton, MenuObject {
    var juice: Menu = .mangoJuice
}
