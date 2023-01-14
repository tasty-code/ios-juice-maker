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

final class StrawberryButton: UIButton, JuiceButtonProtocol {
    var fruitJuice: FruitJuice = .strawberry
}

final class StrawberryBananaButton: UIButton, JuiceButtonProtocol {
    var fruitJuice: FruitJuice = .strawberryBanana
}

final class BananaButton: UIButton, JuiceButtonProtocol {
    var fruitJuice: FruitJuice = .banana
}

final class PineappleButton: UIButton, JuiceButtonProtocol {
    var fruitJuice: FruitJuice = .pineapple
}

final class MangoKiwiButton: UIButton, JuiceButtonProtocol {
    var fruitJuice: FruitJuice = .mangoKiwi
}

final class KiwiButton: UIButton, JuiceButtonProtocol {
    var fruitJuice: FruitJuice = .kiwi
}

class MangoButton: UIButton, JuiceButtonProtocol {
    var fruitJuice: FruitJuice = .mango
}
