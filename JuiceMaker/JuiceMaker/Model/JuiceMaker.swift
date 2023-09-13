//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    private let fruitStore = FruitStore()
    
    func mixJuice(of menu: JuiceMenu) throws {
        let fruitCheck = try IsEnoughFruit(of: menu)
        if fruitCheck == false {
            throw InventoryError.noLongerConsumeError
        }
        
        let recipe = menu.recipe
        for (fruit, count) in recipe {
            try fruitStore.consume(storedFruit: fruit, withCount: count)
        }
    }
    
    private func IsEnoughFruit(of menu: JuiceMenu) throws -> Bool {
        let recipe = menu.recipe
        for (fruit, count) in recipe {
            let remainedFruit = try fruitStore.remainingCount(storedFruit: fruit)
            
            if remainedFruit < count {
                return false
            }
        }
        return true
    }
}
