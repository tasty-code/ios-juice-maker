//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    private var fruitInventory: [Fruit: UInt] = [
        Fruit.strawberry: 10,
        Fruit.banana: 10,
        Fruit.pineapple: 10,
        Fruit.kiwi: 10,
        Fruit.mango: 10
    ]
    
    func consume(of fruit: Fruit, for count: UInt) throws {
        guard fruitInventory.contains(where: { $0.key == fruit }),
              let remainedCount = fruitInventory[fruit] else { throw InventoryError.invalidMenuError }
        
        if remainedCount < count { throw InventoryError.noLongerConsumeError }
        
        fruitInventory[fruit] = (remainedCount - count)
    }
    
    func getRemainedCount(of fruit: Fruit) throws -> UInt{
        guard let remainedCount = fruitInventory[fruit] else { throw InventoryError.invalidMenuError }
        return remainedCount
    }
    
    func setFruitCount(of fruit: Fruit,_ count: UInt) {
        fruitInventory[fruit] = count
    }
    
    func increaseFruitCount(of fruit: Fruit) {
        guard var reamainedCount = fruitInventory[fruit] else { return }
        fruitInventory[fruit] = (reamainedCount + 1)
    }
}
