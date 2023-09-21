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

final class StrawberryJuiceButton: JuiceButton  {
    override func pickMenu() -> JuiceMenu? {
        return .strawberryJuice
    }
}

final class BananaJuiceButton: JuiceButton {
    override func pickMenu() -> JuiceMenu? {
        return .bananaJuice
    }
}

final class PineappleJuiceButton: JuiceButton {
    override func pickMenu() -> JuiceMenu? {
        return .pineappleJuice
    }
}

final class KiwiJuiceButton: JuiceButton {
    override func pickMenu() -> JuiceMenu? {
        return .kiwiJuice
    }
}

final class MangoJuiceButton: JuiceButton {
    override func pickMenu() -> JuiceMenu? {
        return .mangoJuice
    }
}

final class StrawberryBananaJuiceButton: JuiceButton {
    override func pickMenu() -> JuiceMenu? {
        return .strawberryBananaJuice
    }
}

final class MangoKiwiJuiceButton: JuiceButton {
    override func pickMenu() -> JuiceMenu? {
        return .mangoKiwiJuice
    }
}

