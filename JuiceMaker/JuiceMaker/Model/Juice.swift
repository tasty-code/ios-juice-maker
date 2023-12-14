//
//  Juice.swift
//  JuiceMaker
//
//  Created by nayeon  on 2023/12/06.
//

import Foundation

enum Juice: String {
    case strawberry = "딸기쥬스"
    case banana = "바나나쥬스"
    case pineapple = "파인애플쥬스"
    case kiwi = "키위쥬스"
    case mango = "망고쥬스"
    case strawberryBanana = "딸바쥬스"
    case mangoKiwi = "망키쥬스"
    
    var recipe: [Fruits: Int] {
        switch self {
        case .strawberry:
            return [Fruits.strawberry: 16]
        case .banana:
            return [Fruits.banana: 2]
        case .kiwi:
            return [Fruits.kiwi: 3]
        case .pineapple:
            return [Fruits.pineapple: 2]
        case .strawberryBanana:
            return [Fruits.strawberry: 10, Fruits.banana: 1]
        case .mango:
            return [Fruits.mango: 3]
        case .mangoKiwi:
            return [Fruits.mango: 2, Fruits.kiwi: 1]
        }
    }
}
