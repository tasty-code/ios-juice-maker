//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
final class FruitStore {
    var fruits = [ "strawberry": 10,
                   "banana": 10,
                   "pineapple": 10,
                   "kiwi": 10,
                   "mango": 10
    ]
    
    var recipes = ["strawberry": [16],
                   "banana": [2],
                   "kiwi": [3],
                   "pineapple": [2],
                   "strawberry,banana": [10, 1],
                   "mango": [3],
                   "mango,kiwi": [2, 1],
                   "mango,kiwi,strawberry": [1, 2, 3]
    ]
    
    func supplyFruits(fruitName: String, quantity: Int) {
        if let currentStock = fruits[fruitName] {
            fruits[fruitName] = currentStock + quantity
        } else {
            print("error")
        }
    }
}
