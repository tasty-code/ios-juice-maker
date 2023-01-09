//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    let fruitStore = FruitStore()

    func hasEnoughStock(fruit: FruitStore.Fruit, requiredCount: UInt) throws {
        guard let stock = fruitStore.stockByFruit[fruit] else {
            throw JuiceMakerError.notExistFruit
        }
        guard stock >= requiredCount else {
            throw JuiceMakerError.outOfStock
        }
    }

    func make(juice: Juice) throws {
        for (fruit, requiredCount) in juice.recipe {
            try hasEnoughStock(fruit: fruit, requiredCount: requiredCount)
        }
        for (fruit, count) in juice.recipe {
            try fruitStore.subtractStock(fruit: fruit, count: count)
        }
    }
}
