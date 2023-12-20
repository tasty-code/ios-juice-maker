//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

final class FruitStore {
    private(set) var fruitStock = [Fruits: Int]()
    static let shared = FruitStore()
    
    private init() {
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
    
    func checkStockAvailability(recipe: [Fruits: Int]) -> Result<Bool, JuiceMakerError> {
        for (fruit, amount) in recipe {
            guard let stock = fruitStock[fruit], stock >= amount else {
                return .failure(.insufficientStock)
            }
        }
        return .success(true)
    }
    
    func quantity(of fruit: Fruits) -> Int {
        return fruitStock[fruit] ?? 0
    }
}
