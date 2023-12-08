//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom.
//  Copyright © 유니 & 이안. All rights reserved.
//

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    
    func make(juice: Juice) {
        guard FruitStore.shared.compareFruitInventory(juice: juice) else {
            return
        }
        for (fruit, quantity) in juice.recipe {
            FruitStore.shared.consume(fruit: fruit, amount: quantity)
        }
        print("\(juice.name) 나왔습니다.")
    }
}
