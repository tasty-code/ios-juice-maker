//
//  JuiceMaker - JuiceMaker.swift
//  Created by 미르 & 미성
//  Copyright © yagom academy. All rights reserved.
// 

struct JuiceMaker {
    private let fruitStore: FruitStore
    
    init(fruitStore: FruitStore = FruitStore()) {
        self.fruitStore = fruitStore
    }
    
    func orderJuice(juice: Juice) throws {
        for (fruitName, quantity) in juice.recipe {
            try fruitStore.consumeFruit(fruit: fruitName, num: quantity)
        }
    }
}
