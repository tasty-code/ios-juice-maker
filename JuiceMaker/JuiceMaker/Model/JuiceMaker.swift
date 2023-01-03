//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    private let fruitStore = FruitStore.shared
    
    private func checkOrderable(of ingredients: [Fruits: Int]) -> Bool {
        for ingredient in ingredients {
            let eachStock = fruitStore.countStock(of: ingredient.key)
            guard eachStock >= ingredient.value else { return false }
        }
        return true
    }
    
    private func startBlending(of juice: Juice) {
        juice.recipe.forEach {
            fruitStore.decrease(of: $0.key, amount: $0.value)
        }
    }
}
