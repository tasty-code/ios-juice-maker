//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    
    func makeJuice(juice: Juice) {
        guard FruitStore.shared.compareFruitInventory(juice: juice) else {
            return
        }
        for (fruit, quantity) in juice.juiceRecipe {
            FruitStore.shared.usedFruitInventory(fruit: fruit, inventory: quantity)
        }
        print("\(juice.juiceName) 나왔습니다.")
    }
}
