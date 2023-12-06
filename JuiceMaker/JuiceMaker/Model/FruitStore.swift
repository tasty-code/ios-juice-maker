//
//  JuiceMaker - FruitStore.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct FruitStore {
    var inventory: [FruitType: Int]
    
    init() {
        inventory = [.banana: 10, .kiwi: 10, .mango: 10, .pineapple: 10, .strawberry: 10]
    }

    mutating func updateInventory(fruit: FruitType, quantity: Int) {
        guard let currentQuantity = inventory[fruit] else { return }
        inventory[fruit] = currentQuantity + quantity
    }

    mutating func getQuantity(of fruit: FruitType) -> Int {
        return inventory[fruit, default: 0]
    }
}
