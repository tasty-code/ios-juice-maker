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
        let originalFruitContainer = fruitStore.checkFruitContainer()
        
        for (fruit, requiredQuantity) in dic {
            var remainingQuantity = fruitStore.quantity(of: fruit)
            
            if remainingQuantity < requiredQuantity {
                fruitStore.updateFruitContainer(with: originalFruitContainer)
                throw JuiceMakerError.invalidRequest
            }
            
            remainingQuantity -= requiredQuantity
            fruitStore.updateFruitQuantity(of: fruit, by: remainingQuantity)
        }
    }
}
