//
//  JuiceMaker - JuiceMaker.swift
//  Created by Kyle & L
//

struct JuiceMaker {
    let fruitStore: FruitStore
    
    func makeJuice(juice: Juice) {
        for (fruit, count) in juice.recipe {
            fruitStore.useJuiceIngredient(fruit: fruit, count: count)
        }
    }
    
    func checkUnderstockedFruits(juice: Juice) throws {
        var understockedFruits: [String] = []
        var canMakeJuice: Bool = true
        
        for (fruit, count) in juice.recipe {
            guard
                fruitStore.hasEnoughStock(fruit: fruit, count: count)
            else {
                understockedFruits.append(fruit.name)
                canMakeJuice = false
                continue
            }
        }
        guard
            canMakeJuice
        else {
            let understockedFruit = understockedFruits.joined(separator: ",")
            throw JuiceMakerError.outOfStock(fruit: understockedFruit)
        }
    }
}
