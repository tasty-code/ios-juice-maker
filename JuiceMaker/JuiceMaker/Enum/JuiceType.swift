//
//  Juice.swift
//  JuiceMaker
//
//  Created by Matthew on 12/7/23.
//

import Foundation

enum JuiceType: Int64 {
    case strawberryJuice
    case bananaJuice
    case pineappleJuice
    case kiwiJuice
    case mangoJuice
    case strawberryBananaJuice
    case mangoKiwiJuice
    
    var recipe: [FruitData] {
        switch self {
        case .strawberryJuice:
            return [FruitData(name: FruitType.strawberry, quantity: 16)]
        case .bananaJuice:
            return [FruitData(name: FruitType.banana, quantity: 2)]
        case .pineappleJuice:
            return [FruitData(name: FruitType.pineapple, quantity: 2)]
        case .kiwiJuice:
            return [FruitData(name: FruitType.kiwi, quantity: 3)]
        case .mangoJuice:
            return [FruitData(name: FruitType.mango, quantity: 3)]
        case .strawberryBananaJuice:
            return [FruitData(name: FruitType.strawberry, quantity: 10), FruitData(name: .banana, quantity: 1)]
        case .mangoKiwiJuice:
            return [FruitData(name: FruitType.mango, quantity: 2), FruitData(name: FruitType.kiwi, quantity: 1)]
        }
    }
    
    static var allCases: [JuiceType] {
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
