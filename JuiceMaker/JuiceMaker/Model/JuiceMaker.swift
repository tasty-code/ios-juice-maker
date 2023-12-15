//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
    
    // MARK: Properties
    private let fruitStore: FruitStore
    
    // MARK: Initializer
    init(fruitStore: FruitStore = FruitStore.shared, counter: Int = 0) {
        self.fruitStore = fruitStore
    }
    
    // MARK: Custom Methods
    
    /// 쥬스 제조 메서드
    func makeJuice(juiceType: Juice) throws {
        let dic = juiceType.requiredFruitQuantity
        let originalFruitContainer = fruitStore.fruitContainer
        
        for (fruit, quantity) in dic {
            guard var storedFruit = fruitStore.fruitContainer[fruit] else {
                return
            }
            
            if storedFruit < quantity {
                fruitStore.fruitContainer = originalFruitContainer
                throw JuiceMakerError.invalidRequest
            }
            
            storedFruit -= quantity
            fruitStore.fruitContainer[fruit] = storedFruit
        }
    }
}
