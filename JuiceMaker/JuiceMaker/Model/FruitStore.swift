//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum Fruit {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
}

enum ValueError: Error {
    case noValue
}

class FruitStore {
    var fruits: [Fruit: Int] = [
        .strawberry: 10,
        .banana: 10,
        .pineapple: 10,
        .kiwi: 10,
        .mango: 10,
    ]
    
    init() {}
    
    func getFruitQuantity(of: Fruit) throws -> Int {
        guard let result = fruits[of] else { throw ValueError.noValue }
        return result
    }
    
    func setFruit(of: Fruit, quantity: Int) {
        fruits[of] = quantity
    }
}
