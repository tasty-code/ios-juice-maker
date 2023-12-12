//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

struct JuiceMaker {
    private let fruitStore: FruitStore
    
    init(fruitStore: FruitStore) {
        self.fruitStore = fruitStore
    }
    
    private func consumeFruitsForMakingJuice(flavor: JuiceFlavor) throws {
        try fruitStore.consume(ingredients: flavor.recipe)
    }
}
