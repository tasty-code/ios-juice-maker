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
        setUpInitialFruitsStock()
    }
    
    private(set) var storage: [Fruit: Int] = [:]
    
    func updateStock(fruit: Fruit, amount: Int) {
        storage[fruit] = amount
    }
    
    func consume(fruits: [Fruit: Int]) throws {
        for (fruitName, amount) in fruits {
            guard let currentStock = storage[fruitName], 
                      amount <= currentStock else {
                throw StorageError.insufficientStock
            }
        }
        
        for (fruitName, amount) in fruits {
            storage[fruitName]? -= amount
        }
    }
    
    private func setUpInitialFruitsStock() {
        for fruit in Fruit.allCases {
            storage[fruit] = 10
        }
    }
}
