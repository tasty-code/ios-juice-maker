//
//  Juice.swift
//  JuiceMaker
//
//  Created by jun on 2023/01/05.
//

import Foundation

enum Juice {
    case strawberry, banana, kiwi, pineapple, strawberryBanana, mango, mangoKiwi

    var recipe: [FruitStore.Fruit: UInt] {
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
