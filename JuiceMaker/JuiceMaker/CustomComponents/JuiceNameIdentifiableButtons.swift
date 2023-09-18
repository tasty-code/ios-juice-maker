//
//  JuiceNameIdentifiableButtons.swift
//  JuiceMaker
//
//  Created by Swain Yun on 2023/09/18.
//

import UIKit

class StrawberryJuiceOrderButton: UIButton, JuiceNameIdentifiable {
    var juiceName: FruitStore.JuiceType = .strawberryJuice
}

class BananaJuiceOrderButton: UIButton, JuiceNameIdentifiable {
    var juiceName: FruitStore.JuiceType = .bananaJuice
}

class KiwiJuiceOrderButton: UIButton, JuiceNameIdentifiable {
    var juiceName: FruitStore.JuiceType = .kiwiJuice
}

class MangoJuiceOrderButton: UIButton, JuiceNameIdentifiable {
    var juiceName: FruitStore.JuiceType = .mangoJuice
}

class PineappleJuiceOrderButton: UIButton, JuiceNameIdentifiable {
    var juiceName: FruitStore.JuiceType = .pineappleJuice
}

class StrawberryBananaMixJuiceOrderButton: UIButton, JuiceNameIdentifiable {
    var juiceName: FruitStore.JuiceType = .strawberryBananaMixJuice
}

class MangoKiwiMixJuiceOrderButton: UIButton, JuiceNameIdentifiable {
    var juiceName: FruitStore.JuiceType = .mangoKiwiMixJuice
}
