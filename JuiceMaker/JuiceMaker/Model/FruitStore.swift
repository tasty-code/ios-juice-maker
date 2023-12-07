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
    
    private var fruitInventory: [Fruit: Int] = [
        .strawberry: 10,
        .banana: 10,
        .kiwi: 10,
        .pineapple: 10,
        .mango: 10
    ]
    
    private func addFruitInventory(fruit: Fruit, inventory: Int) {
        fruitInventory[fruit, default: 0] += inventory
    }
    
    func usedFruitInventory(fruit: Fruit, inventory: Int) {
        fruitInventory[fruit, default: 0] -= inventory
    }
    
    private func getFruitInventory(fruit: Fruit) -> Int {
        return fruitInventory[fruit, default: 0]
    }
    
    func compareFruitInventory(juice: Juice) -> Bool {
        for (fruit, quantity) in juice.juiceRecipe {
            let currentInventory = getFruitInventory(fruit: fruit)
            
            if currentInventory <= quantity {
                print("재고부족")
                return false
            }
        }
        return true
    }
}
