//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker<T: Storing> where T.Element == Fruit {
    private(set) var fruitStore: T
    
    mutating func make(juice: Juice) throws {
        let ingredients: [Fruit: Int] = juice.recipe
        try self.fruitStore.subtract(pairOfItems: ingredients)
    }
}

