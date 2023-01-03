//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum Fruits: CaseIterable {
    case strawberry
    case banana
    case kiwi
    case pineapple
    case mango
}

enum State {
    case warehosing
    case forwarding
}

typealias Quantity = Int

final class FruitStore {
    static let shared = FruitStore()

    private var fruitBasket: [Fruits: Quantity] = [:]

    private init() {
        Fruits.allCases.forEach { fruit in
            fruitBasket[fruit] = 10
        }
    }
    
    func add(fruit: Fruits, quantity: Quantity) {
        guard let stock = fruitBasket[fruit] else {
            return
        }
        fruitBasket.updateValue(stock + quantity, forKey: fruit)
    }
  
    func remove(fruit: Fruits, quantity: Quantity) {
        guard let stock = fruitBasket[fruit] else {
            return
        }
        fruitBasket.updateValue(stock - quantity, forKey: fruit)
    }
}
