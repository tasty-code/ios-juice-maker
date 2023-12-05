//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
final class FruitStore {
    private var fruitStocks: [Fruit: FruitStock]
    
    init() {
        let newFruits: [Fruit: FruitStock] = Fruit.allCases.reduce(into: [:]) { (result, fruit) in
            let stock = FruitStock(fruitType: fruit)
            result[fruit] = stock
        }
        self.fruitStocks = newFruits
    }
    
    func getFruits(_ fruit: Fruit, count: Int) throws {
        guard let targetFruitStore = fruitStocks[fruit] else { return }
        try targetFruitStore.consumeFruits(count: count)
    }
}
