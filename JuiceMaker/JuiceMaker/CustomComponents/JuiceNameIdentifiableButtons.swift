//
//  JuiceNameIdentifiableButtons.swift
//  JuiceMaker
//
//  Created by Swain Yun on 2023/09/18.
//

import UIKit

class StrawberryJuiceOrderButton: UIButton, JuiceNameIdentifiable {
    var juiceName: JuiceName = .strawberryJuice
}

class BananaJuiceOrderButton: UIButton, JuiceNameIdentifiable {
    var juiceName: JuiceName = .bananaJuice
}

class KiwiJuiceOrderButton: UIButton, JuiceNameIdentifiable {
    var juiceName: JuiceName = .kiwiJuice
}

class MangoJuiceOrderButton: UIButton, JuiceNameIdentifiable {
    var juiceName: JuiceName = .mangoJuice
}

class PineappleJuiceOrderButton: UIButton, JuiceNameIdentifiable {
    var juiceName: JuiceName = .pineappleJuice
}

class StrawberryBananaMixJuiceOrderButton: UIButton, JuiceNameIdentifiable {
    var juiceName: JuiceName = .strawberryBananaMixJuice
}

class MangoKiwiMixJuiceOrderButton: UIButton, JuiceNameIdentifiable {
    var juiceName: JuiceName = .mangoKiwiMixJuice
}
