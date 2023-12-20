//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © 유니 & 이안. All rights reserved.
//

import Foundation

 class FruitStore {
    
    private var fruitInventory: [Fruit: Int]
    
    init() {
        fruitInventory = [
            .strawberry: 10,
            .banana: 10,
            .kiwi: 10,
            .pineapple: 10,
            .mango: 10
        ]
    }
    func add(fruit: Fruit, amount: Int) {
        fruitInventory[fruit, default: 0] += amount
    }
     
    func changeAmout(fruit: Fruit, amout: Int) {
        fruitInventory[fruit, default: 0] = amout
    }
     
    func inventory(fruit: Fruit) -> Int {
        return fruitInventory[fruit, default: 0]
    }
    
    func consume(fruit: Fruit, amount: Int) {
        fruitInventory[fruit, default: 0] -= amount
    }
    
    private func canConsume(fruit: Fruit, amount: Int) -> Bool {
        let currentInventory = inventory(fruit: fruit)
        return currentInventory >= amount
    }
    
    func checkInventoryError(fruit: Fruit, amount: Int) throws {
        guard amount >= 0 else {
            throw JuiceMakerError.negativeAmount(fruit: fruit)
        }
        guard canConsume(fruit: fruit, amount: amount) else {
            throw JuiceMakerError.outOfStock(fruit: fruit)
        }
    }
}
