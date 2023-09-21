//
//  FruitButton.swift
//  JuiceMaker
//
//  Created by 김경록 on 2023/09/20.
//

import UIKit

class JuiceButton: UIButton {
    func pickMenu() -> JuiceMenu? { return nil }
}

class StrawberryJuiceButton: JuiceButton  {
    override func pickMenu() -> JuiceMenu? {
        return .strawberryJuice
    }
}

class BananaJuiceButton: JuiceButton {
    override func pickMenu() -> JuiceMenu? {
        return .bananaJuice
    }
}

class PineappleJuiceButton: JuiceButton {
    override func pickMenu() -> JuiceMenu? {
        return .pineappleJuice
    }
}

class KiwiJuiceButton: JuiceButton {
    override func pickMenu() -> JuiceMenu? {
        return .kiwiJuice
    }
}

class MangoJuiceButton: JuiceButton {
    override func pickMenu() -> JuiceMenu? {
        return .mangoJuice
    }
}

class StrawberryBananaJuiceButton: JuiceButton {
    override func pickMenu() -> JuiceMenu? {
        return .strawberryBananaJuice
    }
}

class MangoKiwiJuiceButton: JuiceButton {
    override func pickMenu() -> JuiceMenu? {
        return .mangoKiwiJuice
    }
}

