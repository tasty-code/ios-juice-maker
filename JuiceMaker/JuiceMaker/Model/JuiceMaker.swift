//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
    
    private let fruitStore = FruitStore.shared
    
    /// 쥬스 제조 메서드
    func makeJuice(juiceType: Juice) throws {
        let dic = juiceType.checkFruitQuantity()
        
        for (fruit, quantity) in dic {
            guard var storedFruit = fruitStore.fruitContainer[fruit] else {
                return
            }
            
            if storedFruit < quantity {
                throw JuiceMakerError.invalidRequest
            }
            
            storedFruit -= quantity
            fruitStore.fruitContainer[fruit] = storedFruit
        }
    }
}
