//
//  JuiceButtons.swift
//  JuiceMaker
//
//  Created by 김용재 on 2023/01/11.
//

import UIKit

protocol JuiceMakableButton {
    var fruitJuice: FruitJuice { get }
}

class StrawberryBananaButton: UIButton, JuiceMakableButton {
    var fruitJuice: FruitJuice = .strawberryBanana
}

class BananaButton: UIButton, JuiceMakableButton {
    var fruitJuice: FruitJuice = .banana
}

class PineappleButton: UIButton, JuiceMakableButton {
    var fruitJuice: FruitJuice = .pineapple
}

class MangoKiwiButton: UIButton, JuiceMakableButton {
    var fruitJuice: FruitJuice = .mangoKiwi
}

class KiwiButton: UIButton, JuiceMakableButton {
    var fruitJuice: FruitJuice = .kiwi
}

class MangoButton: UIButton, JuiceMakableButton {
    var fruitJuice: FruitJuice = .mango
}
