//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    let fruitStore = FruitStore()
    
    func isEnoughStock(fruit: FruitStore.Fruit, requiredQuantity: UInt) throws -> Bool {
        let stock = try fruitStore.isExist(fruit: fruit)
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
