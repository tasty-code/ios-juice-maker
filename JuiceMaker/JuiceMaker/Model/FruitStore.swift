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
        if originStock - stock >= 0 {
            store.updateValue(originStock - stock, forKey: fruit)
        }
    }
    
    func sendBackToAvailableStock(fruit type: Fruit) -> Int {
        guard let availableStock = store[type] else {
            return 0
        }
        return availableStock
    }
    
    func needCountOfMake(to juiceType: SingleFruitJuice) -> Int {
        var needCountValue = 0
        
        juiceType.recipe.forEach { fruit in
            guard let needCount = juiceType.recipe[fruit.key] else {
                return
            }
            needCountValue = needCount
        }
        return needCountValue
    }
    
    func needCountOfMake(to juiceType: MixFruitJuice) -> [Int] {
        var needCountValues = [Int]()
        
        juiceType.recipe.forEach { fruit in
            guard let needCount = juiceType.recipe[fruit.key] else {
                return
            }
            needCountValues.append(needCount)
        }
        return needCountValues
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
