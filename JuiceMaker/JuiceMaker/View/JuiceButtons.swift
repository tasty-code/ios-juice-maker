//
//  JuiceButtons.swift
//  JuiceMaker
//
//  Created by 김용재 on 2023/01/11.
//

import UIKit

protocol JuiceButtonProtocol {
    var fruitJuice: FruitJuice { get }
}

class StrawberryButton: UIButton, JuiceButtonProtocol {
    var fruitJuice: FruitJuice = .strawberry
}

class StrawberryBananaButton: UIButton, JuiceButtonProtocol {
    var fruitJuice: FruitJuice = .strawberryBanana
}

class BananaButton: UIButton, JuiceButtonProtocol {
    var fruitJuice: FruitJuice = .banana
}

class PineappleButton: UIButton, JuiceButtonProtocol {
    var fruitJuice: FruitJuice = .pineapple
}

class MangoKiwiButton: UIButton, JuiceButtonProtocol {
    var fruitJuice: FruitJuice = .mangoKiwi
}

class KiwiButton: UIButton, JuiceButtonProtocol {
    var fruitJuice: FruitJuice = .kiwi
}

class MangoButton: UIButton, JuiceButtonProtocol {
    var fruitJuice: FruitJuice = .mango
}
