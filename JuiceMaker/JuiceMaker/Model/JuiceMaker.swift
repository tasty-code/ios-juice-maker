//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    var fruitStore: FruitStore
    
    func make(juice: Juice) throws -> Juice {
        let 재료 = juice.재료
        guard fruitStore.hasEnough(pairOfItems: 재료) else {
            throw InvalidError.outOfStock
        }
        fruitStore.subtract(pairOfItems: 재료)
        
        return juice
    }
}
