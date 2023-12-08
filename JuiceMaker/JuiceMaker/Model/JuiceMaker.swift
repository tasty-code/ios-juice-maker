//
//  JuiceMaker - JuiceMaker.swift
//  Created by Kyle& L
//  Copyright © yagom academy. All rights reserved.
//

struct JuiceMaker {
    var fruitStore: FruitStore = FruitStore(strawberry: 10, banana: 10, pineapple: 10, kiwi: 10, mango: 10)
    
    func makeJuice(juice: Juice) {
        for (fruit, count) in juice.recipe {
            fruitStore.useJuiceIngredient(fruit: fruit, count: count)
        }
    }
    func checkUnderstockedFruits(juice: Juice) throws {
        var understockedFruits: [String] = []
        var canMakeJuice = true
        
        for (fruit, count) in juice.recipe {
            guard
                hasEnoughStock(for: fruit, count: count)
            else {
                understockedFruits.append(fruit.name)
                canMakeJuice = false
                continue
            }
        }
        
        guard canMakeJuice else {
            let understockedFruit = understockedFruits.joined(separator: ",")
            throw JuiceMakerError.outOfStock(fruit: understockedFruit)
        }
    }
    
    private func hasEnoughStock(for fruit: Fruits, count: Int) -> Bool {
        guard let fruits = fruitStore.fruitStock[fruit] else { return false }
        guard fruits >= count else { return false }
        return true
    }
    
    
}
