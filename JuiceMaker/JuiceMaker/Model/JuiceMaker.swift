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
    init(fruitStore: FruitStore) {
        self.fruitStore = fruitStore
    }
    
    // MARK: Custom Methods
    
    /// 쥬스 제조 메서드
    func makeJuice(juiceType: Juice) throws {
        let dic = juiceType.requiredFruitQuantity
        let originalFruitContainer = fruitStore.fetchFruitContainer()
        
        for (fruit, quantity) in dic {
            var storedFruit = fruitStore.fetchFruitQuantity(of: fruit)
            
            if storedFruit < quantity {
                fruitStore.updateFruitContainer(originalFruitContainer)
                throw JuiceMakerError.invalidRequest
            }
            
            storedFruit -= quantity
            fruitStore.updateFruitQuantity(of: fruit, by: storedFruit)
        }
    }
}
