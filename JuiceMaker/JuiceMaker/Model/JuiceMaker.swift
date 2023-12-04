//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    private let fruitStore: FruitStore
    
    init(fruitStore: FruitStore) {
        self.fruitStore = fruitStore
    }
    
    func makeJuice(flavor: JuiceFlavor) throws {
        try flavor.recipe.forEach { (fruit: Fruits, count: Int) in
            try fruitStore.get(fruit, count: count)
        }
    }
}
