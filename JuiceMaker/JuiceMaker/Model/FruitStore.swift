//
//  JuiceMaker - FruitStore.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

final class FruitStore {
    private var fruitStocks: [Fruit: FruitStock]
    
    init(initialCount: Int) {
        let newStocks: [Fruit: FruitStock] = Fruit.allCases.reduce(into: [:]) { (result, fruit) in
            let stock = FruitStock(fruitType: fruit, count: initialCount)
            result[fruit] = stock
        }
        self.fruitStocks = newStocks
    }
    
    private func consume(_ fruitType: Fruit, numberOfFruits: Int) throws -> FruitStock {
        guard let copyOfTargetStock = fruitStocks[fruitType] else {
            throw JuiceMakerError.fruitStockNotFound
        }
        let newTarget = try copyOfTargetStock.fruitsConsumed(count: numberOfFruits)
        return newTarget
    }
    
    func consume(ingredients: JuiceIngredients) throws -> [FruitStock] {
        let newFruitStocks: [FruitStock] = try ingredients.reduce(into: []) { (result, ingredient) in
            let newStock = try consume(ingredient.key, numberOfFruits: ingredient.value)
            result.append(newStock)
        }
        
        for newFruitStock in newFruitStocks {
            let fruitType = newFruitStock.fruitType
            self.fruitStocks[fruitType] = newFruitStock
        }
        return newFruitStocks
    }
    
    func fetchStocks() -> [FruitStock] {
        return self.fruitStocks.map { stock in stock.value }
    }
    
    func updateStock(of fruitType: Fruit, to newCount: Int) throws -> FruitStock {
        guard let copyOfTargetStock = self.fruitStocks[fruitType] else {
            throw JuiceMakerError.fruitStockNotFound
        }
        let newStock = try copyOfTargetStock.updateCount(to: newCount)
        self.fruitStocks[fruitType] = newStock
        return newStock
    }
}
