//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    
    func compareFruitInventory(for juice: JuiceType) {
        for (fruit, quantity) in juice.juiceRecipe {
            let currentInventory = FruitStore.shared.getFruitInvetory(for: fruit)
            
            if currentInventory <= quantity {
                print("재고부족")
            } else {
                
            }
        }
    }
}
