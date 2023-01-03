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
        guard hasEnoughStock(for: fruitJuice) else {
            return print("쥬스를 만들기 위한 재고가 부족합니다.")
        }
        
        fruitJuice.recipe.forEach { fruit, numberOfUse in
            fruitStore.changeStock(of: fruit, by: -numberOfUse)
        }
    }
    
    private func hasEnoughStock(for fruitJuice: FruitJuice) -> Bool {
        return fruitJuice.recipe.allSatisfy { fruit, numberOfUse in
            (fruitStore.stock[fruit] ?? 0) >= numberOfUse
        }
    }
}
