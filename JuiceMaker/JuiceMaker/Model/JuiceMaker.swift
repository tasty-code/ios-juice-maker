//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker<T:Storing> where T.Element == Fruit {
    private(set) var fruitStore: T
    
    mutating func make(juice: Juice) throws -> Juice {
        let ingredients: [Fruit: Int] = juice.ingredients
        guard fruitStore.hasEnough(pairOfItems: ingredients) else {
            throw JMError.outOfStock
        }
        self.fruitStore.subtract(pairOfItems: ingredients)
        
        return juice
    }
}

