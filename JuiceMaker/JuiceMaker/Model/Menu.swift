//
//  Menu.swift
//  JuiceMaker
//
//  Created by 박재우 on 2023/01/03.
//

import Foundation

enum Menu: Int {
    case strawberryBananaJuice = 0
    case strawberryJuice
    case bananaJuice
    case pineappleJuice
    case mangoKiwiJuice
    case kiwiJuice
    case mangoJuice

    var recipe: [Fruits: Quantity] {
        switch self {
        case .strawberryBananaJuice:
            return [.strawberry: 10, .banana: 1]
        case .strawberryJuice:
            return [.strawberry: 16]
        case .bananaJuice:
            return [.banana: 2]
        case .pineappleJuice:
            return [.pineapple: 2]
        case .mangoKiwiJuice:
            return [.mango: 2, .kiwi: 1]
        case .kiwiJuice:
            return [.kiwi: 3]
        case .mangoJuice:
            return [.mango: 3]
        }
    }
}

extension Menu {
    var koreanName: String {
        switch self {
        case .strawberryBananaJuice:
            return "딸바 쥬스"
        case .strawberryJuice:
            return "딸기 쥬스"
        case .bananaJuice:
            return "바나나 쥬스"
        case .pineappleJuice:
            return "파인애플 쥬스"
        case .mangoKiwiJuice:
            return "망키 쥬스"
        case .kiwiJuice:
            return "키위 쥬스"
        case .mangoJuice:
            return "망고 쥬스"
        }
    }
}
