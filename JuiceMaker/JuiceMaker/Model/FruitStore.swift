//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © 유니 & 이안. All rights reserved.
//

import Foundation

final class FruitStore {
    
    static let shared = FruitStore()
    
    private init() {}
    
    private var fruitInventory: [Fruit: Int] = [
        .strawberry: 10,
        .banana: 10,
        .kiwi: 10,
        .pineapple: 10,
        .mango: 10
    ]
    func add(fruit: Fruit, amount: Int) {
        fruitInventory[fruit, default: 0] += amount
    }
    func inventory(fruit: Fruit) -> Int {
        return fruitInventory[fruit, default: 0]
    }
    
    func consume(fruit: Fruit, amount: Int) {
        fruitInventory[fruit, default: 0] -= amount
        print("\(fruit.name) - \(amount)")
        print(fruitInventory)
    }
    
    private func canConsume(fruit: Fruit, amount: Int) -> Bool {
        let currentInventory = inventory(fruit: fruit)
        return currentInventory >= amount
    }
    
    func checkInventoryError(fruit: Fruit, amount: Int) throws {
        guard canConsume(fruit: fruit, amount: amount) else {
            throw JuiceMakerError.outOfStock(fruit: fruit)
        }
        guard amount >= 0 else {
            throw JuiceMakerError.negativeAmount(fruit: fruit)
        }
    }
}
