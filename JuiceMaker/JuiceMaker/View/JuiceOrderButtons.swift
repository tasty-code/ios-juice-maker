//
//  JuiceOrderButtons.swift
//  JuiceMaker
//
//  Created by 김보미 on 2023/01/12.
//

import Foundation
import UIKit

class StrawberryJuiceButton: UIButton, JuiceOrderable {
    var juice: Juices = .strawberry
}

class BananaJuiceButton: UIButton, JuiceOrderable {
    var juice: Juices = .banana
}

class KiwiJuiceButton: UIButton, JuiceOrderable {
    var juice: Juices = .kiwi
}

class PineappleJuiceButton: UIButton, JuiceOrderable {
    var juice: Juices = .pineapple
}

class StrawBananaJuiceButton: UIButton, JuiceOrderable {
    var juice: Juices = .strawBanana
}

class MangoJuiceButton: UIButton, JuiceOrderable {
    var juice: Juices = .mango
}

class MangoKiwiJuiceButton: UIButton, JuiceOrderable {
    var juice: Juices = .mangoKiwi
}
