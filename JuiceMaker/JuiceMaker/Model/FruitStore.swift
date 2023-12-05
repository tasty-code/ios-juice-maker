//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    private var fruitInventory: [String: Int] = [
        "딸기": 10,
        "바나나": 10,
        "파인애플": 10,
        "키위": 10,
        "망고": 10
    ]
    func updateFruitQuantity(fruit: String, quantity: Int) {
        if let currentQuantity = fruitInventory[fruit] {
            fruitInventory[fruit] = max(0,currentQuantity + quantity)
        }
    }
    
    
    
}

