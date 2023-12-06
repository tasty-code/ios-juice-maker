//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
    
    func useFruits(fruit: FruitType.RawValue, quantity: Int) throws {
        let currentQuantity = fruitStore.getQuantity(of: FruitType(rawValue: fruit) ?? .banana)
        guard currentQuantity >= quantity else {
            throw ErrorType.insufficientFruits
        }
        fruitStore.updateInventory(fruit: FruitType(rawValue: fruit) ?? .banana, quantity: -quantity)
    }
}
