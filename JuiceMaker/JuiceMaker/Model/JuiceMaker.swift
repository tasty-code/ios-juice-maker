//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
    private let fruitStore = FruitStore()
    
    func makeJuice(order: JuiceMenu) throws {
        let fruitCheck = try isEnoughFruit(order: order)
        if fruitCheck == false {
            throw InventoryError.noLongerConsumeError
        }
        
        let recipe = order.recipe
        for (fruit, count) in recipe {
            try fruitStore.consume(fruit: fruit, withCount: count)
        }
    }
    
    private func isEnoughFruit(order: JuiceMenu) throws -> Bool {
        let recipe = order.recipe
        for (fruit, count) in recipe {
            let remainedFruit = try fruitStore.remainingCount(fruit: fruit)
            
            if remainedFruit < count {
                return false
            }
        }
        return true
    }
    
    func remainingCount(fruit: Fruit) throws -> UInt {
        return try fruitStore.remainingCount(fruit: fruit)
    }
    
    func changeCount(fruit: Fruit, newCount: UInt) {
        fruitStore.changeCount(fruit: fruit, newCount: newCount)
    }
}
