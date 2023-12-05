//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    var fruitStock = [String: Int]()
    init() {
        fruitStock = [
            "strawberry": 10,
            "banana": 10,
            "pineapple": 10,
            "kiwi": 10,
            "mango": 10
        ]
    }
    
    func changeStock(recipe: [String: Int]) {
        for(fruit, amount) in recipe {
            guard var currentStock = fruitStock[fruit] else { return }
            currentStock -= amount
            fruitStock[fruit] = currentStock
        }
    }
    
    func checkStockAvailability(for recipe: [String: Int]) -> Bool {
        for (fruit, amount) in recipe {
            guard let stock = fruitStock[fruit], stock >= amount else {
                return false
            }
        }
        return true
    }
}
