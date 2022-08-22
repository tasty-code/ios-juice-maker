//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceIngredient {
    var count: Int
}

enum Juice: String {
    case strawberry = "딸기 주스"
    case banana = "바나나 주스"
    case kiwi = "키위 주스"
    case pineapple = "파인애플 주스"
    case strawberryBanana = "딸바 주스"
    case mango = "망고 주스"
    case mangoKiwi = "망키 주스"
    
    var recipe: [Fruit: JuiceIngredient] {
        switch self {
        case .strawberry:
            return [.strawberry: JuiceIngredient(count: 16)]
        case .banana:
            return [.banana: JuiceIngredient(count: 2)]
        case .kiwi:
            return [.kiwi: JuiceIngredient(count: 3)]
        case .pineapple:
            return [.pineapple: JuiceIngredient(count: 2)]
        case .strawberryBanana:
            return [.strawberry: JuiceIngredient(count: 10), .banana: JuiceIngredient(count: 1)]
        case .mango:
            return [.mango: JuiceIngredient(count: 3)]
        case .mangoKiwi:
            return [.mango: JuiceIngredient(count: 2), .kiwi: JuiceIngredient(count: 1)]
        }
    }
}

struct JuiceMaker {
   let fruitStore = FruitStore()

}
