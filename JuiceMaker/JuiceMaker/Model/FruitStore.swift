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
    
    func consume(storedFruit: Fruit, withCount: UInt) throws {
        guard let remainedCount = fruitInventory[storedFruit] else {
            throw InventoryError.invalidMenuError
        }
        
        if remainedCount < withCount {
            throw InventoryError.noLongerConsumeError
        }
        
        fruitInventory[storedFruit] = remainedCount - withCount
    }
    
    func remainingCount(storedFruit: Fruit) throws -> UInt {
        guard let remainedCount = fruitInventory[storedFruit] else {
            throw InventoryError.invalidMenuError
        }
        return remainedCount
    }
    
    func changeCount(storedFruit: Fruit, withCount: UInt) {
        fruitInventory[storedFruit] = withCount
    }
    
    func increaseCount(storedFruit: Fruit) {
        guard var reamainedCount = fruitInventory[storedFruit] else { return }
        fruitInventory[storedFruit] = reamainedCount + 1
    }
}
