//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
final class FruitStore {
    
    static let shared = FruitStore()
    
    private init() {}
    
    var fruitInventory: [FruitType: Int] = [
        .strawberry: 10,
        .banana: 10,
        .kiwi: 10,
        .pineapple: 10,
        .mango: 10
    ]
    
    func addFruitInvetory(for fruit: FruitType, inventory: Int) {
        fruitInventory[fruit, default: 0] += inventory
    }
    
    func usedFruitInventory(for fruit: FruitType, inventory: Int) {
        fruitInventory[fruit, default: 0] -= inventory
    }
    
    func getFruitInvetory(for fruit: FruitType) -> Int {
        return fruitInventory[fruit, default: 0]
    }
}
