//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom.
//  Copyright © 유니 & 이안. All rights reserved.
//

import Foundation

struct JuiceMaker {
    
    func make(juice: Juice) throws {
        for (fruit, requiredAmount) in juice.recipe {
            try FruitStore.shared.checkInventoryError(fruit: fruit, amount: requiredAmount)
        }
        for (fruit, amount) in juice.recipe {
            FruitStore.shared.consume(fruit: fruit, amount: amount)
        }
    }
}
