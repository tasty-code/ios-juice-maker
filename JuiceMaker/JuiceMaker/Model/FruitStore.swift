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
    
    weak var textUpdateDelegate: textUpdateDelegate?
    
    private init() {
        Fruits.allCases.forEach { fruit in
            fruits[fruit] = 10
        }
    }

    func stock(fruit: Fruits) -> Quantity {
        guard let stock = fruits[fruit] else {
            return Int()
        }
        return stock
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
            guard let stock = fruits[fruit] else {
                return
            }
            let newQuantity = stock - quantity
            fruits.updateValue(newQuantity, forKey: fruit)
            textUpdateDelegate?.updateLabel(fruit: fruit)
        }
    }
    
    private func checkFruit(according recipe: [Fruits: Quantity]) throws {
        for (fruit, quantity) in recipe {
            guard let stock = fruits[fruit] else {
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
