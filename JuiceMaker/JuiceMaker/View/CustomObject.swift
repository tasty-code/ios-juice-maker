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

class strawberryLabel: UILabel, FruitObject {
    var fruit: Fruits = .strawberry
}

class bananaLabel: UILabel, FruitObject {
    var fruit: Fruits = .banana
}

class pineappleLabel: UILabel, FruitObject {
    var fruit: Fruits = .pineapple
}

class kiwiLabel: UILabel, FruitObject {
    var fruit: Fruits = .kiwi
}

class mangoLabel: UILabel, FruitObject {
    var fruit: Fruits = .mango
}

class strawberryBananaButton: UIButton, MenuObject {
    var juice: Menu = .strawberryBananaJuice
}

class strawberryButton: UIButton, MenuObject {
    var juice: Menu = .strawberryJuice
}

class bananaButton: UIButton, MenuObject {
    var juice: Menu = .bananaJuice
}

class pineappleButton: UIButton, MenuObject {
    var juice: Menu = .pineappleJuice
}

class mangoKiwiButton: UIButton, MenuObject {
    var juice: Menu = .mangoKiwiJuice
}

class kiwiButton: UIButton, MenuObject {
    var juice: Menu = .kiwiJuice
}

class mangoButton: UIButton, MenuObject {
    var juice: Menu = .mangoJuice
}
