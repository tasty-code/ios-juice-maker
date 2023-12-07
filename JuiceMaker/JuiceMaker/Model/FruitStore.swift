//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

final class FruitStore {
    private var fruitStocks: [Fruit: FruitStock]
    
    init() {
        let newStocks: [Fruit: FruitStock] = Fruit.allCases.reduce(into: [:]) { (result, fruit) in
            let stock = FruitStock(fruitType: fruit)
            result[fruit] = stock
        }
        self.fruitStocks = newStocks
    }
    
    
    func consume(_ fruitType: Fruit, numberOfFruits: Int) throws {
        guard let targetFruitStore = fruitStocks[fruitType] else { return }
        try targetFruitStore.consumeFruits(count: numberOfFruits)
    }
}
