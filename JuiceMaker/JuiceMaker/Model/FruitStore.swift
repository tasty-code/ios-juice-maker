//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
final class FruitStore {
    private var fruitStock = [Fruits: Int]()
    
    init() {
        fruitStock = [
            .strawberry: 10,
            .banana: 10,
            .pineapple: 10,
            .kiwi: 10,
            .mango: 10
        ]
    }
    
    func changeStock(fruitName: Fruits, amount: Int) {
        guard var currentStock = fruitStock[fruitName] else { return }
        currentStock += amount
        fruitStock[fruitName] = currentStock
    }
    
    func checkStockAvailability(recipe: [Fruits: Int]) -> Bool {
        for (fruit, amount) in recipe {
            guard let stock = fruitStock[fruit], stock >= amount else {
                return false
            }
        }
        return true
    }
}
