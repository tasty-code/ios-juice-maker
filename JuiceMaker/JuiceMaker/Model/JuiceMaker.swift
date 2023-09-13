//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    private let fruitStore = FruitStore()
    
    func makeJuice(order: JuiceMenu) throws {
        let fruitCheck = try isEnoughFruit(order: order)
        if fruitCheck == false {
            throw InventoryError.noLongerConsumeError
        }
        
        let recipe = order.recipe
        for (fruit, count) in recipe {
            try fruitStore.consume(storedFruit: fruit, withCount: count)
        }
    }
    
    private func isEnoughFruit(order: JuiceMenu) throws -> Bool {
        let recipe = order.recipe
        for (fruit, count) in recipe {
            let remainedFruit = try fruitStore.remainingCount(storedFruit: fruit)
            
            if remainedFruit < count {
                return false
            }
        }
        return true
    }
}
