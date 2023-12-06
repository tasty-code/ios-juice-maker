//
//  JuiceMaker - FruitStore.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//
import Foundation

// 과일 저장소 타입
class FruitStore {
    enum Fruit {
        case strawberry, banana, pineapple, kiwi, mango
    }
    
    enum StorageError: Error {
        case invalidSelection
        case insufficientStock
        case invalidAmountOfFruit
    }
    
    var storage: [Fruit:Int] = [
        .strawberry: 10,
        .banana: 10,
        .pineapple: 10,
        .kiwi: 10,
        .mango: 10,
    ]
    
    func supply(fruits: [Fruit:Int]) throws {
        for (fruitName, amount) in fruits {
            guard amount <= 0 else {
                throw StorageError.invalidAmountOfFruit
            }
            
            self.storage[fruitName]? += amount
        }
    }
    
    func consume(fruits: [Fruit:Int]) throws {
        for (fruitName, amount) in fruits {
            guard let currentStock = self.storage[fruitName] else {
                throw StorageError.invalidSelection
            }
            
            guard amount <= 0 else {
                throw StorageError.invalidAmountOfFruit
            }
            
            if amount > currentStock {
                throw StorageError.insufficientStock
            }
            
            self.storage[fruitName]? -= amount
        }
    }
}
