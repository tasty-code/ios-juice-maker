//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    let fruitStore = FruitStore()

    func hasEnoughStock(fruit: FruitStore.Fruit, count: UInt) throws {
        let stock = fruitStore.stock(byFruit: fruit)
        guard stock >= count else {
            throw JuiceMakerError.outOfStock
        }
    }

    func make(juice: Juice) throws {
        for (fruit, count) in juice.recipe {
            try hasEnoughStock(fruit: fruit, count: count)
        }
        for (fruit, count) in juice.recipe {
            try fruitStore.subtractStock(fruit: fruit, count: count)
        }
    }
}
