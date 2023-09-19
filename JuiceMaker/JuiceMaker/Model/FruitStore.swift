//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    private var fruitInventory: [Fruit: UInt] = [
        .strawberry: 10,
        .banana: 10,
        .pineapple: 10,
        .kiwi: 10,
        .mango: 10
    ]
    
    func consume(fruit: Fruit, withCount: UInt) throws {
        guard let remainedCount = fruitInventory[fruit] else {
            throw InventoryError.invalidError
        }
        
        if remainedCount < withCount {
            throw InventoryError.noLongerConsumeError
        }
        
        fruitInventory[fruit] = remainedCount - withCount
    }
    
    func remainingCount(fruit: Fruit) throws -> UInt {
        guard let remainedCount = fruitInventory[fruit] else {
            throw InventoryError.invalidError
        }
        return remainedCount
    }
    
    func changeCount(fruit: Fruit, newCount: UInt) {
        fruitInventory[fruit] = newCount
    }
    
    func increaseCount(fruit: Fruit) {
        guard let reamainedCount = fruitInventory[fruit] else { return }
        fruitInventory[fruit] = reamainedCount + 1
    }
}
