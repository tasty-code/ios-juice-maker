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
    
    func consumeFruit(juice: Juice) {
        for (fruitName, numberOfFruits) in juice.recipe {
            guard let stock = fruitStock[fruitName] else { return }
            
            fruitStock.updateValue(stock - numberOfFruits, forKey: fruitName)
        }
    }
}


