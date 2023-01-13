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
    
    weak var updateDelegate: UpdateDelegate?
    
    private init() {
        Fruits.allCases.forEach { fruit in
            fruits[fruit] = 10
        }
    }

    func stock(fruit: Fruits) -> Quantity? {
        guard let stock = fruits[fruit] else {
            return nil
        }
        return stock
    }
    
    func update(fruit: Fruits, quantity: Quantity) {
        fruits.updateValue(quantity, forKey: fruit)
        updateDelegate?.updateLabel(fruit: fruit)
    }
}
