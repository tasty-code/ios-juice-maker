//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
    private var fruitStore: FruitStore
    
    init(fruitStore: FruitStore) {
        self.fruitStore = fruitStore
    }
    
    private func isEnough(juice: Juice) -> Bool {
        var stockCheck: Bool = true
        for (fruit, count) in juice.recipe {
            guard fruitStore.checkStock(fruit: fruit, count: count) else {
                stockCheck = false
                break
            }
        }
        return stockCheck
    }
    
    public mutating func makeJuice(juice: Juice) -> Juice? {
        guard isEnough(juice: juice) else {
            return nil
        }
        
        juice.recipe.forEach(fruitStore.release)
        
        return juice
    }

}
