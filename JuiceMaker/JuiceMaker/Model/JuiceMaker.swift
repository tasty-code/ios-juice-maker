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
    
    func isEnoughStock(fruit: FruitStore.Fruit, requiredQuantity: UInt) throws -> Bool {
        guard let stock = self.fruitStore.stockByFruit[fruit] else {
            throw JuiceMakerError.notExistFruit
        }
        return stock >= requiredQuantity
    }

    func makeJuice(_ juice: Juice) throws {
        for (fruit, requiredQuantity) in juice.recipe where try !isEnoughStock(fruit: fruit, requiredQuantity: requiredQuantity) {
            throw JuiceMakerError.outOfStock
        }
        for (fruit, quantity) in juice.recipe {
            try self.fruitStore.subtractStock(fruitType: fruit, quantity: quantity)
        }
    }
}
