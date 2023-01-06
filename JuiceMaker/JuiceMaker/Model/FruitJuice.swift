//
//  FruitJuice.swift
//  JuiceMaker
//
//  Created by 김용재 on 2023/01/02.
//

import Foundation

enum FruitJuice: Int {
    case strawberryBanana
    case strawberry
    case banana
    case pineapple
    case mangoKiwi
    case kiwi
    case mango
    
    var recipe: [Fruit: Int] {
        switch self {
        case .strawberryBanana:
            return [Fruit.strawberry: 10, Fruit.banana: 1]
        case .strawberry:
            return [Fruit.strawberry: 16]
        case .banana:
            return [Fruit.banana: 2]
        case .pineapple:
            return [Fruit.pineapple: 2]
        case .mangoKiwi:
            return [Fruit.mango: 2, Fruit.kiwi: 1]
        case .kiwi:
            return [Fruit.kiwi: 3]
        case .mango:
            return [Fruit.mango: 3]
        }
    }
    
    var name: String {
        switch self {
        case .strawberryBanana:
            return "딸바쥬스"
        case .strawberry:
            return "딸기쥬스"
        case .banana:
            return "바나나쥬스"
        case .pineapple:
            return "파인애플쥬스"
        case .mangoKiwi:
            return "망키쥬스"
        case .kiwi:
            return "키위쥬스"
        case .mango:
            return "망고쥬스"
        }
    }
}
