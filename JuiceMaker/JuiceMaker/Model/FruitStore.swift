//
//  JuiceMaker - FruitStore.swift
//  Created by 미르 & 미성
//  Copyright © yagom academy. All rights reserved.
//

// 과일 저장소 타입
class FruitStore {
    var fruitStock: [Fruit: UInt]
    
    init(fruitStock: [Fruit : UInt] = [.banana: 10, .kiwi: 10, .mango: 10, .pineapple: 10, .strawberry: 10]) {
        self.fruitStock = fruitStock
    }
    
    func checkStock(juice: Juice) -> Bool {
        for (fruitName, numberOfFruits) in juice.recipe {
            guard let stock = fruitStock[fruitName] else { return false }
            guard stock >= numberOfFruits else { return false }
        }
        return true
    }
    
    func consumeFruit(juice: Juice) -> Bool {
        guard checkStock(juice: juice) else { return false }
        
        for (fruitName, numberOfFruits) in juice.recipe {
            guard let stock = fruitStock[fruitName] else { return false }
            fruitStock.updateValue(stock - numberOfFruits, forKey: fruitName)
        }
        return true
    }
}
