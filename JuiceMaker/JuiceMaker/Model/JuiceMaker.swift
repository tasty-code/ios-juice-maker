//
//  JuiceMaker - JuiceMaker.swift
//  Created by 미르 & 미성
//  Copyright © yagom academy. All rights reserved.
// 

struct JuiceMaker {
    private var fruitStore: FruitStore
    
    init(fruitStore: FruitStore = FruitStore()) {
        self.fruitStore = fruitStore
    }
    
    func orderJuice(juice: Juice) throws {
        try fruitStore.consumeFruit(juice: juice)
    }
}
