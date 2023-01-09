//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    static let shared = FruitStore()
    
    var fruits: [Fruits:Fruit] = Fruits.makeFruitArray()
    
    func increaseStock(of fruit: Fruits, by amount: Int = 1) {
        guard fruits.keys.contains(fruit) else { return }
        print(#function, " amount: \(amount)")
        fruits[fruit]?.stock += amount
    }
    
    func decreaseStock(of fruit: Fruits, by amount: Int = -1) {
        guard fruits.keys.contains(fruit) else { return }
        guard fruits[fruit]?.stock ?? 0 >= abs(amount) else { return }
        print(#function, " amount: \(amount)")
        fruits[fruit]?.stock += amount
    }
    
    func changeStock(of fruit: Fruits, by amount: Int) {
        print(#function, " amount: \(amount)")
        if amount >= 0 {
            increaseStock(of: fruit, by: amount)
            return
        } else {
            decreaseStock(of: fruit, by: amount)
            return
        }
    }
    
    func checkStock(message: [OrderMessage]) throws {
        for recipe in message {
            print(#function)
            guard abs(recipe.amount) <= fruits[recipe.fruitName]?.stock ?? 0 else {
                print(fruits[recipe.fruitName]?.stock ?? 0)
                throw Errors.ouOfStock
            }
        }
    }
    
    private init() {}
}
