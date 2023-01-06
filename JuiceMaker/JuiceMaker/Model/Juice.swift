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
            return [.strawberry: 16]
        case .banana:
            return [.banana: 2]
        case .kiwi:
            return [.kiwi: 3]
        case .pineapple:
            return [.pineapple: 2]
        case .strawberryBanana:
            return [.strawberry: 10, .banana: 1]
        case .mango:
            return [.mango: 3]
        case .mangoKiwi:
            return [.mango: 2, .kiwi: 1]
        }
    }
}
