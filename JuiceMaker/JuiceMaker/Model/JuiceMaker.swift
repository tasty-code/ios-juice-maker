//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    let fruitStore: FruitStore

    func make(juice: Juice) throws {
        if !fruitStore.hasEnoughStock(recipe: juice.recipe) {
            throw JuiceMakerError.outOfStock
        }
        for (fruit, count) in juice.recipe {
            try fruitStore.subtractStock(fruit: fruit, count: count)
        }
    }
}
