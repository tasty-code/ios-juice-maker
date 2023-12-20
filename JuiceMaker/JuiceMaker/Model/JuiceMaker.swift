//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom.
//  Copyright © 유니 & 이안. All rights reserved.
//

import Foundation

struct JuiceMaker {
    let fruitStore = FruitStore()
    
    func make(juice: Juice) throws {
        for (fruit, requiredAmount) in juice.recipe {
            try fruitStore.checkInventoryError(fruit: fruit, amount: requiredAmount)
        }
        for (fruit, amount) in juice.recipe {
            fruitStore.consume(fruit: fruit, amount: amount)
        }
    }
}
