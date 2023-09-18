//
//  JuiceMenu.swift
//  JuiceMaker
//
//  Created by 김경록 on 2023/09/12.
//

import Foundation

enum JuiceMenu {
    case strawberryJuice
    case bananaJuice
    case pineappleJuice
    case kiwiJuice
    case mangoJuice
    case strawberryBananaJuice
    case mangoKiwiJuice
     
    var description: String {
        switch self {
        case .strawberryJuice: return "딸기"
        case .bananaJuice: return "바나나"
        case .pineappleJuice: return "파인애플"
        case .kiwiJuice: return "키위"
        case .mangoJuice: return "망고"
        case .strawberryBananaJuice: return "딸기바나나"
        case .mangoKiwiJuice: return "망고키위"
        }
    }
    
    func juiceRecipe() -> [Fruit: Int] {
        switch self {
        case .strawberryJuice:
            return [.strawberry: 16]
        case .bananaJuice:
            return [.banana: 2]
        case .pineappleJuice:
            return [.pineapple: 2]
        case .kiwiJuice:
            return [.kiwi: 3]
        case .mangoJuice:
            return [.mango: 3]
        case .strawberryBananaJuice:
            return [.strawberry: 10, .banana: 1]
        case .mangoKiwiJuice:
            return [.mango: 2, .kiwi: 1]
        }
    }
}
