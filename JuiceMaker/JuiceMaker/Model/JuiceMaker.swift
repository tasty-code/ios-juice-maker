//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
    var fruitStore: FruitStore
    
    func make(juice: Juice) throws -> Juice {
        let ingredients: [Fruit: Int] = juice.ingredients
        guard fruitStore.hasEnough(pairOfItems: ingredients) else {
            throw JuiceMakerError.outOfStock
        }
        fruitStore.subtract(pairOfItems: ingredients)
        
        return juice
    }
}
