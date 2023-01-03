//
//  Juice.swift
//  JuiceMaker
//
//  Created by J.E on 2023/01/03.
//

import Foundation

enum Juice: String {
    case strawberry = "딸기"
    case banana = "바나나"
    case kiwi = "키위"
    case pineapple = "파인애플"
    case strawberryBanana = "딸바"
    case mango = "망고"
    case mangoKiwi = "망키"
    
    var orderTitle: String {
        return self.rawValue + "쥬스 주문"
    }
    
    var recipe: [Fruits: Int] {
        switch self {
        case .strawberry:
            return [.strawberries: 16]
        case .banana:
            return [.bananas: 2]
        case .kiwi:
            return [.kiwis: 3]
        case .pineapple:
            return [.pineapples: 2]
        case .strawberryBanana:
            return [.strawberries: 10, .bananas: 1]
        case .mango:
            return [.mangos: 3]
        case .mangoKiwi:
            return [.mangos: 2, .kiwis: 1]
        }
    }
}
