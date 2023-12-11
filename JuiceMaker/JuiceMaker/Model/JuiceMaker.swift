//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    private let fruitStore = FruitStore()
    
    mutating func makeJuice(juice: Juice) {
        do {
            let recipe = juice.recipe
            guard fruitStore.checkStockAvailability(recipe: recipe) else {
                throw JuiceMakerError.insufficientStock
            }
            
            for (fruit, amount) in recipe {
                fruitStore.changeStock(fruitName: fruit, amount: -amount)
            }
        } catch JuiceMakerError.insufficientStock {
            print(JuiceMakerError.insufficientStock.errorMessage)
        } catch {
            print(JuiceMakerError.unexpected.errorMessage)
        }
    }
}
