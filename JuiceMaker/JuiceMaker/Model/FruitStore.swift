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
    @discardableResult func add(fruit: Fruit, amount: Int) -> Int {
        fruitInventory[fruit, default: 0] += amount
        return fruitInventory[fruit, default: 0]
    }
    @discardableResult func consume(fruit: Fruit, amount: Int) throws -> Int {
        try canConsume(fruit: fruit, amount: amount)
        
        guard amount >= 0 else {
            throw JuiceMakerError.negativeAmount
        }
        fruitInventory[fruit, default: 0] -= amount
        return fruitInventory[fruit, default: 0]
    }
    
    private func inventory(fruit: Fruit) -> Int {
        return fruitInventory[fruit, default: 0]
    }
    
    private func canConsume(fruit: Fruit, amount: Int) throws {
            let currentInventory = inventory(fruit: fruit)
            
            if currentInventory < amount {
                throw JuiceMakerError.outOfStock
            }
    }
}
