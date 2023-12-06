//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
final class FruitStore {
    var fruits = [ Fruit.strawberry.rawValue: 10,
                   Fruit.banana.rawValue: 10,
                   Fruit.pineapple.rawValue: 10,
                   Fruit.kiwi.rawValue: 10,
                   Fruit.mango.rawValue: 10
    ]
    
    var recipes = [Recipe.strawberry.rawValue: [16],
                   Recipe.banana.rawValue: [2],
                   Recipe.kiwi.rawValue: [3],
                   Recipe.pineapple.rawValue: [2],
                   Recipe.strawberryBanana.rawValue: [10, 1],
                   Recipe.mango.rawValue: [3],
                   Recipe.mangoKiwi.rawValue: [2, 1],
    ]
    
    func supplyFruits(fruitName: String, quantity: Int) {
        if let currentStock = fruits[fruitName] {
            fruits[fruitName] = currentStock + quantity
        } else {
            print("error")
        }
    }
    
    func initFruits() {
        Fruit.allCases.forEach {  key in
            fruits[key.rawValue] = 10
        }
    }
}
