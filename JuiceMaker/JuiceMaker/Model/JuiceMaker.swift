//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
    private var fruitStore: FruitStore
    
    func make(juice: Juice) throws -> Juice {
        let ingredients: [Fruit: Int] = juice.ingredients
        guard fruitStore.hasEnough(pairOfItems: ingredients) else {
            throw JMError.outOfStock
        }
        fruitStore.subtract(pairOfItems: ingredients)
        
        return juice
    }
}
