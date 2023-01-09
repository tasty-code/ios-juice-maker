//
//  FruitJuice.swift
//  JuiceMaker
//
//  Created by 신동오 on 2023/01/05.
//

import Foundation

enum FruitJuice: String {
    case strawberry = "딸기 쥬스"
    case banana = "바나나 쥬스"
    case kiwi = "키위 쥬스"
    case pineapple = "파인애플 쥬스"
    case strawberryBanana = "딸바 쥬스"
    case mango = "망고 쥬스"
    case mangoKiwi = "망키 쥬스"

    var recipe: [Fruit: UInt] {
        switch self {
        case .strawberry:
            return [Fruit.strawberry: 16]
        case .banana:
            return [Fruit.banana: 2]
        case .kiwi:
            return [Fruit.kiwi: 3]
        case .pineapple:
            return [Fruit.pineapple: 2]
        case .strawberryBanana:
            return [Fruit.strawberry: 10, Fruit.banana: 1]
        case .mango:
            return [Fruit.mango: 3]
        case .mangoKiwi:
            return [Fruit.mango: 2, Fruit.kiwi: 1]
        }
    }
}
