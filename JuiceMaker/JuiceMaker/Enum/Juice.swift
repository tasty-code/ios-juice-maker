//
//  Juice.swift
//  JuiceMaker
//
//  Created by Matthew on 12/7/23.
//

import UIKit

enum Juice: String, CaseIterable {
    case strawberryJuice = "딸기쥬스"
    case bananaJuice = "바나나쥬스"
    case pineappleJuice = "파인애플쥬스"
    case kiwiJuice = "키위쥬스"
    case mangoJuice = "망고쥬스"
    case strawberryBananaJuice = "딸바쥬스"
    case mangoKiwiJuice = "망키쥬스"
    
    var recipe: [FruitInfo] {
        switch self {
        case .strawberryJuice:
            return [FruitInfo(name: Fruit.strawberry, quantity: 16)]
        case .bananaJuice:
            return [FruitInfo(name: Fruit.banana, quantity: 2)]
        case .pineappleJuice:
            return [FruitInfo(name: Fruit.pineapple, quantity: 2)]
        case .kiwiJuice:
            return [FruitInfo(name: Fruit.kiwi, quantity: 3)]
        case .mangoJuice:
            return [FruitInfo(name: Fruit.mango, quantity: 3)]
        case .strawberryBananaJuice:
            return [FruitInfo(name: Fruit.strawberry, quantity: 10), FruitInfo(name: .banana, quantity: 1)]
        case .mangoKiwiJuice:
            return [FruitInfo(name: Fruit.mango, quantity: 2), FruitInfo(name: Fruit.kiwi, quantity: 1)]
        }
    }
    
    static var allCases: [Juice] {
        return [
            .strawberryJuice,
            .bananaJuice,
            .pineappleJuice,
            .kiwiJuice,
            .mangoJuice,
            .strawberryBananaJuice,
            .mangoKiwiJuice
        ]
    }
}
