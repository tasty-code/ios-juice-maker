//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    let fruitStore = FruitStore.shared
    
    func requestToMakeJuice(fruitName: FruitList, numToConsume: Int){
        guard var currentStock = fruitStore.store[fruitName] else{
            return
        }
        guard currentStock - numToConsume >= 0 else {
            return
        }
        currentStock -= numToConsume
        fruitStore.store[fruitName] = currentStock
    }
}
