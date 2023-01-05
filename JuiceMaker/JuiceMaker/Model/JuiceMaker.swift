//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    private let fruitStore = FruitStore()
    
    func makeJuice(of fruitJuice: FruitJuice) throws {
        guard hasEnoughStock(for: fruitJuice) else {
            throw StockError.notEnoughToMakeJuice
        }
        
        for (fruit, numberOfUse) in fruitJuice.recipe {
            try fruitStore.changeStock(of: fruit, by: -numberOfUse)
        }
    }
    
    private func hasEnoughStock(for fruitJuice: FruitJuice) -> Bool {
        return fruitJuice.recipe.allSatisfy { fruit, numberOfUse in
            (fruitStore.stock[fruit] ?? 0) >= numberOfUse
        }
    }
}
