//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © 유니 & 이안. All rights reserved.
//

import Foundation

 class FruitStore {
    
    private var fruitInventory: [Fruit: Int]
    
     init(strawberryAmout: Int = 10, bananaAmout: Int = 10, KiwiAmout: Int = 10, pineappleAmout: Int = 10, mangoAmout: Int = 10) {
        fruitInventory = [
            .strawberry: strawberryAmout,
            .banana: bananaAmout,
            .kiwi: KiwiAmout,
            .pineapple: pineappleAmout,
            .mango: mangoAmout
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
    
//    func consume(fruit: Fruit, amount: Int) throws {
     func consume(juice: Juice) throws {
         for (fruit, requiredAmount) in juice.recipe {
             try checkInventoryError(fruit: fruit, amount: requiredAmount)
         }
         for (fruit, amount) in juice.recipe {
             fruitInventory[fruit, default: 0] -= amount
         }
    }
    
    private func canConsume(fruit: Fruit, amount: Int) -> Bool {
        let currentInventory = inventory(fruit: fruit)
        return currentInventory >= amount
    }
    
    private func checkInventoryError(fruit: Fruit, amount: Int) throws {
        guard amount >= 0 else {
            throw JuiceMakerError.negativeAmount(fruit: fruit)
        }
        guard canConsume(fruit: fruit, amount: amount) else {
            throw JuiceMakerError.outOfStock(fruit: fruit)
        }
    }
}
