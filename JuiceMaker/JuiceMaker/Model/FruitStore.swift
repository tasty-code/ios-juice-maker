//
//  JuiceMaker - FruitStore.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

final class FruitStore {
    private var fruits: [Fruit] = [
        Fruit(.strawberry, 10),
        Fruit(.banana, 10),
        Fruit(.kiwi, 10),
        Fruit(.pineapple, 10),
        Fruit(.mango, 10)
    ]
    
    func receiveOrder(juiceType: JuiceType) {
        let requiredFruit: [Fruit] = juiceType.recipe
        
        do {
            let integrityFruits = try makeIntegrityFruitArray(requiredFruits: requiredFruit)
            try updateFruitsQuantity(for: integrityFruits)
        } catch {
            // Add error handling logic here later
        }
    }
    
    private func makeIntegrityFruitArray(requiredFruits fruits: [Fruit]) throws -> [Fruit] {
        var resultArr: [Fruit] = []
        
        for fruit in fruits {
            resultArr.append(try validateQuantity(with: fruit))
        }
        
        return resultArr
    }
    
    private func validateQuantity(with fruit: Fruit) throws -> Fruit {
        guard let inventoryFruit = self.fruits.filter({ $0.showFruitType() == fruit.showFruitType() }).first else { throw Exception.fruitNotFound }
        
        let quantityDistance: Int = inventoryFruit.quantityDistance(target: fruit)
        guard quantityDistance >= 0 else { throw Exception.outOfQuantity }
        
        return Fruit(fruit.showFruitType(), quantityDistance)
    }
    
    private func updateFruitsQuantity(for fruits: [Fruit]) throws {
        for fruit in fruits {
            let index = try findFruitFirstIndex(target: fruit)
            self.fruits[index] = fruit.updateFruit(for: fruit.showQuantity())
        }
    }
    
    private func findFruitFirstIndex(target: Fruit) throws -> Int {
        guard let index = self.fruits.firstIndex(where: { $0.showFruitType() == target.showFruitType() }) else { throw Exception.fruitNotFound }
        return index
    }
}
