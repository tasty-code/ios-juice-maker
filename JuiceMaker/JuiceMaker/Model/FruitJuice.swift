//
//  FruitJuice.swift
//  JuiceMaker
//
//  Created by 김용재 on 2023/01/02.
//

import Foundation

enum FruitJuice: Int {
    case strawberryBanana = 1
    case strawberry = 2
    case banana = 3
    case pineapple = 4
    case mangoKiwi = 5
    case kiwi = 6
    case mango = 7
    
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
}
