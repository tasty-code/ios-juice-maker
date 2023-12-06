//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    let fruitStore: FruitStore
    init(fruitStore: FruitStore) {
        self.fruitStore = fruitStore
    }
    func makeJuice(juiceRecipe: JuiceRecipe) throws -> String {
        return try fruitStore.makeJuice(juiceRecipe: juiceRecipe)
    }
}
