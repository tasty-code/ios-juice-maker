//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    let fruitStore = FruitStore()

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
    
    func hasEnoughStock(fruit: FruitStore.Fruit, requiredCount: UInt) throws {
        guard let stock = fruitStore.stockByFruit[fruit] else {
            throw JuiceMakerError.notExistFruit
        }
        guard stock >= requiredCount else {
            throw JuiceMakerError.outOfStock
        }
    }

    func make(juice: Juice) throws {
        for (fruit, requiredCount) in juice.recipe {
            try hasEnoughStock(fruit: fruit, requiredCount: requiredCount)
        }
        for (fruit, count) in juice.recipe {
            try fruitStore.subtractStock(fruit: fruit, count: count)
        }
    }
}
