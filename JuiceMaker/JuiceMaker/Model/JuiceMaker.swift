//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    private let fruitStore: FruitStore = FruitStore.shared

    func makeJuice(juice: Juice) -> Bool {
        let recipe = juice.recipe
        let isSucceed = fruitStore.checkStockAvailability(recipe: recipe)
        switch isSucceed {
        case .success:
            recipe.forEach { (fruit, amount) in
                fruitStore.changeStock(fruitName: fruit, amount: -amount)
            }
            return true
        case .failure:
            return false
        }
    }
}
