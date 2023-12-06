//
//  JuiceMaker - FruitStore.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//
import Foundation

enum FruitStoreError: Error {
    case invalidSelection
    case insufficientStock
}

// 과일 저장소 타입
class FruitStore {
    enum Fruit {
        case strawberry, banana, pineapple, kiwi, mango
    }
    
    var storage: [Fruit:UInt] = [
        .strawberry: 10,
        .banana: 10,
        .pineapple: 10,
        .kiwi: 10,
        .mango: 10,
    ]
    
    func supply(fruits: [FruitStore.Fruit:UInt]) {
        for (fruitName, amount) in fruits {
            self.storage[fruitName]? += amount
        }
    }
    
    func consume(fruits: [FruitStore.Fruit:UInt]) throws {
        for (fruitName, amount) in fruits {
            guard let currentStock = self.storage[fruitName] else {
                throw FruitStoreError.invalidSelection
            }
            
            if amount > currentStock {
                throw FruitStoreError.insufficientStock
            }
            
            self.storage[fruitName]? -= amount
        }
    }
}
