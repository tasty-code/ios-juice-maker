//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

typealias Quantity = Int

final class FruitStore {
    static let shared = FruitStore()
    
    private var fruits: [Fruits: Quantity] = [:]
    
    private init() {
        Fruits.allCases.forEach { fruit in
            fruits[fruit] = 10
        }
    }
    
    func add(fruit: Fruits, quantity: Quantity) {
        guard let stock = fruits[fruit] else {
            return
        }
        fruits.updateValue(stock + quantity, forKey: fruit)
    }
    
    func remove(according recipe: [Fruits: Quantity]) throws {
        try checkFruit(according: recipe)
        for (fruit, quantity) in recipe {
            guard let stock = fruitBasket[fruit] else {
                return
            }
            fruitBasket.updateValue(stock - quantity, forKey: fruit)
        }
    }
    
    private func checkFruit(according recipe: [Fruits: Quantity]) throws {
        for (fruit, quantity) in recipe {
            guard let stock = fruitBasket[fruit] else {
                return
            }
            guard stock.isNegative(subtraction: quantity) else {
                throw JuiceError.negativeQuantity(fruit: fruit)
            }
        }
    }
}

private extension Int {
    func isNegative(subtraction sub: Int) -> Bool {
        let result = (self - sub) >= 0
        return result
    }
}
