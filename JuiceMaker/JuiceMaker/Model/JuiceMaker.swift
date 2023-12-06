//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    private var fruitStore = FruitStore()
    
    mutating func makeJuice(juice: Juice) {
        let recipe = juice.recipe
        
        guard fruitStore.checkStockAvailability(recipe: recipe) else { return }
        
        for(fruit, amount) in recipe {
            fruitStore.changeStock(fruitname: fruit, amount: -amount)
        }
    }
}
