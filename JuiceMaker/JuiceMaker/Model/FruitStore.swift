//
//  JuiceMaker - FruitStore.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    enum Fruit {
        case strawberry, banana, pineapple, kiwi, mango
    }
    
    var storage: [Fruit:UInt] = [
        .strawberry: 10,
        .banana: 10,
        .pineapple: 10,
        .kiwi: 10,
        .mango: 10,
    ]
    
    func supplyFruit(for fruitName: Fruit, by count: UInt) {
        self.storage[fruitName]? += count
    }
    
    func consumeFruit(for fruitName: Fruit, by count: UInt) {
        guard let currentStock = self.storage[fruitName] else {
            return
        }
        
        if count > currentStock {
            return
        }
        
        self.storage[fruitName]? -= count
    }
}
