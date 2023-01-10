//
//  Juice.swift
//  JuiceMaker
//
//  Created by 조용현 on 2023/01/03.
//

import Foundation

enum Juice: String {
    case strawberryJuice = "딸기쥬스"
    case bananaJuice = "바나나쥬스"
    case kiwiJuice = "키위쥬스"
    case pineappleJuice = "파인애플쥬스"
    case ddalbaJuice = "딸바쥬스"
    case mangoJuice = "망고쥬스"
    case mangkiJuice = "망키쥬스"
    
    var ingredients: [Fruit: Int] {
        switch self {
        case .strawberryJuice:
            return [.strawberry: 16]
        case .bananaJuice:
            return [.banana: 2]
        case .kiwiJuice:
            return [.kiwi: 3]
        case .pineappleJuice:
            return [.pineapple: 2]
        case .ddalbaJuice:
            return [.strawberry: 10, .banana: 1]
        case .mangoJuice:
            return [.mango: 3]
        case .mangkiJuice:
            return [.mango: 2, .kiwi: 1]
        }
    }
}
