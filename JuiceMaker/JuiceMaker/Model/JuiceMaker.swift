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
        let fruitCheck = try enoughFruit(of: menu)
        if fruitCheck == false {
            throw InventoryError.noLongerConsumeError
        }
        
        let recipe = menu.recipe
        for (fruit, count) in recipe {
            try fruitStore.consume(of: fruit, for: count)
        }
    }
    
    private func enoughFruit(of menu: JuiceMenu) throws -> Bool {
        let recipe = menu.recipe
        for (fruit, count) in recipe {
            let remainedFruit = try fruitStore.getRemainedCount(of: fruit)
            
            if remainedFruit < count {
                return false
            }
        }
        
        return true
    }
}
