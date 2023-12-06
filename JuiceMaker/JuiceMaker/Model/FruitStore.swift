//
//  JuiceMaker - FruitStore.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class FruitStore {
    var inventory: [FruitType: Int]
    
    init() {
        inventory = [.banana: 10, .kiwi: 10, .mango: 10, .pineapple: 10, .strawberry: 10]
    }
    func updateInventory(fruit: FruitType, quantity: Int) {
        guard let currentQuantity = inventory[fruit] else { return }
        inventory[fruit] = currentQuantity + quantity
    }
    
}
