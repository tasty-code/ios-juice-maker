//
//  MenuObject.swift
//  JuiceMaker
//
//  Created by 박재우 on 2023/01/12.
//

import UIKit

protocol MenuObject {
    var juice: Menu { get }
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
