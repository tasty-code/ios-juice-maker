//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

final class FruitStore {
    static let shared = FruitStore(initialStock: 10)
    var store = [Fruit: Int]()
    
    private init(initialStock: Int) {
        Fruit.allCases.forEach {
            store[$0] = initialStock
        }
    }
    
    func update(_ fruit: Fruit, stock: Int) {
        let originStock = sendBackToAvailableStock(fruit: fruit)
        store.updateValue(originStock - stock, forKey: fruit)
    }
    
    func sendBackToAvailableStock(fruit type: Fruit) -> Int {
        guard let availableStock = store[type] else {
            return 0
        }
        return availableStock
    }
    
    func isRemainFruit(type: Fruit, count: Int) -> Bool {
        var discern = false
        
        store.forEach { fruit in
            if fruit.key == type {
                guard fruit.value >= count else {
                    return
                }
                discern = true
            }
        }
        return discern
    }
}
