//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

struct JuiceMaker<Store: Storing, Juice: Makable> where Store.Item == Juice.Ingredient {
    private(set) var fruitStore: Store
    
    mutating func make(juice: Juice) -> Bool {
        let ingredients = juice.recipe
        let isSucceed = self.fruitStore.subtract(pairOfItems: ingredients)
        return isSucceed
    }
}

