//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
    var fruitStore = FruitStore()
    
    mutating func makeJuice(_ juice: JuiceType.RawValue) throws {
        switch juice {
        case "딸기쥬스":
            try useFruits(fruit: "딸기", quantity: 16)
        case "바나나쥬스":
            try useFruits(fruit: "바나나", quantity: 2)
        case "키위쥬스":
            try useFruits(fruit: "키위", quantity: 3)
        case "파인애플쥬스":
            try useFruits(fruit: "파인애플", quantity: 2)
        case "딸기바나나쥬스":
            try useFruits(fruit: "딸기", quantity: 10)
            try useFruits(fruit: "바나나", quantity: 1)
        case "망고쥬스":
            try useFruits(fruit: "망고", quantity: 3)
        case "망고키위쥬스":
            try useFruits(fruit: "망고", quantity: 2)
            try useFruits(fruit: "키위", quantity: 1)
        default:
            ErrorType.insufficientFruits
        }
    }
    
    mutating func useFruits(fruit: FruitType.RawValue, quantity: Int) throws {
        let currentQuantity = fruitStore.getQuantity(of: FruitType(rawValue: fruit) ?? .banana)
        guard currentQuantity >= quantity else {
            throw ErrorType.insufficientFruits
        }
        fruitStore.updateInventory(fruit: FruitType(rawValue: fruit) ?? .banana, quantity: -quantity)
    }
}
