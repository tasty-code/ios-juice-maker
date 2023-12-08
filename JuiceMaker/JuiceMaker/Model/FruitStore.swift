//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © 유니 & 이안. All rights reserved.
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
    @discardableResult private func add(fruit: Fruit, amount: Int) -> Int {
        fruitInventory[fruit, default: 0] += amount
        return fruitInventory[fruit, default: 0]
    }
    @discardableResult func consume(fruit: Fruit, amount: Int) -> Int {
        fruitInventory[fruit, default: 0] -= amount
        return fruitInventory[fruit, default: 0]
    }
    
    private func inventory(fruit: Fruit) -> Int {
        return fruitInventory[fruit, default: 0]
    }
    
    func compareFruitInventory(juice: Juice) -> Bool {
        for (fruit, quantity) in juice.recipe {
            let currentInventory = inventory(fruit: fruit)
            
            if currentInventory <= quantity {
                print("재고부족")
                return false
            }
        }
        return true
    }
}
