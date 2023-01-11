//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class FruitStore {
    static let shared = FruitStore()
    
    var fruits: [Fruits:Fruit] = Fruits.makeFruitArray()
    
    func increaseStock(of fruit: Fruits, by amount: Int = 1) {
        guard fruits.keys.contains(fruit) else { return }
        fruits[fruit]?.stock += amount
    }
    
    func decreaseStock(of fruit: Fruits, by amount: Int = 1) {
        guard fruits.keys.contains(fruit) else { return }
        guard fruits[fruit]?.stock ?? 0 >= amount else { return }
        fruits[fruit]?.stock -= amount
    }

    func checkStock(message: [OrderMessage]) throws {
        for recipe in message {
            guard recipe.amount <= fruits[recipe.fruitName]?.stock ?? 0 else {
                throw Errors.outOfStock
            }
        }
    }
    
    private init() {}
}
