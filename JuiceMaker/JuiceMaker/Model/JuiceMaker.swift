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
    
    func consumeFruitsForMakingJuice(flavor: JuiceFlavor) throws {
        try flavor.recipe.forEach { (fruit: Fruit, count: Int) in
            try fruitStore.consume(fruit, numberOfFruits: count)
        }
    }
}
