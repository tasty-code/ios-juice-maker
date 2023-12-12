//
//  JuiceMaker - FruitStore.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//
import Foundation

// 과일 저장소 타입
class FruitStore {
    enum Fruit: CaseIterable {
        case strawberry, banana, pineapple, kiwi, mango
    }
    
    enum StorageError: Error {
        case insufficientStock
    }
    
    static let shared = FruitStore()
    
    private init() {
        for fruit in Fruit.allCases {
            self.storage[fruit] = 10
        }
    }
    
    private var storage: [Fruit: Int] = [:]
    
    func supply(fruitName: Fruit, amount: Int) throws {
        guard let currentStock = self.storage[fruitName], (currentStock + amount) >= 0 else {
            throw StorageError.insufficientStock
        }
        
        self.storage[fruitName]? += amount
    }
    
    func consume(fruits: [Fruit: Int]) throws {
        for (fruitName, amount) in fruits {
            guard let currentStock = self.storage[fruitName], amount <= currentStock else {
                throw StorageError.insufficientStock
            }
        }
        
        for (fruitName, amount) in fruits {
            self.storage[fruitName]? -= amount
        }
    }
}
