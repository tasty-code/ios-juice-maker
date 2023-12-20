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
            reduceStock(for: recipe)
            return true
        case .failure:
            return false
        }
    }

    private func reduceStock(for recipe: [Fruits: Int]) {
        for (fruit, amount) in recipe {
            fruitStore.changeStock(fruitName: fruit, amount: -amount)
        }
    }
}
