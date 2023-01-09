//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    private let fruitStore = FruitStore.shared
    
    func isMakable(menu: Juice) -> Bool {
        let ingredients = menu.recipe
        for ingredient in ingredients {
            let eachStock = fruitStore.count(of: ingredient.key)
            guard eachStock >= ingredient.value else { return false }
        }
        return true
    }
    
    func startBlending(of juice: Juice) {
        juice.recipe.forEach {
            fruitStore.decrease(of: $0.key, amount: $0.value)
        }
    }
}
