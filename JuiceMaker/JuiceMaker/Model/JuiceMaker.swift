//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    private let fruitStore = FruitStore()
    
    func makeJuice(of fruitJuice: FruitJuice) {
        fruitJuice.recipe.forEach { fruit, numberOfUse in
            fruitStore.changeStock(of: fruit, by: -numberOfUse)
        }
    }
}
