//
//  JuiceMaker - FruitStore.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//
import Foundation

enum FruitStoreError: Error {
    case invalidSelection
    case insufficientStock
}

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
    
    func supplyFruit(ofType fruitName: Fruit, amount count: UInt) {
        self.storage[fruitName]? += count
    }
    
    func consumeFruit(ofType fruitName: Fruit, amount count: UInt) throws {
        guard let currentStock = self.storage[fruitName] else {
            throw FruitStoreError.invalidSelection
        }
        
        if count > currentStock {
            throw FruitStoreError.insufficientStock
        }
        
        self.storage[fruitName]? -= count
    }
}
