//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
    var fruitStore: FruitStore = FruitStore.shared
    
    func isEnough(juice: Juice) -> Bool {
        var stockCheck: Bool = true
        for (fruit, count) in juice.recipe {
            guard fruitStore.checkStock(fruit: fruit, count: count) else {
                stockCheck = false
                break
            }
        }
        return stockCheck
    }
    
    mutating func makeJuice(juice: Juice) -> Juice? {
        guard isEnough(juice: juice) else {
            return nil
        }
        
        juice.recipe.forEach { (fruit: Fruit, count: Int) in
            fruitStore.release(fruit: fruit, count: count)
        }
        
        return juice
    }

}
