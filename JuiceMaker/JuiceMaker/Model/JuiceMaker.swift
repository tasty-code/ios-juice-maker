//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    let fruitStore = FruitStore()
    
    func makeJuice(juice: Juice) -> Result<Bool, JuiceMakerError> {
        do {
            let recipe = juice.recipe
            guard fruitStore.checkStockAvailability(recipe: recipe) else {
                throw JuiceMakerError.insufficientStock
            }
            
            for (fruit, amount) in recipe {
                fruitStore.changeStock(fruitName: fruit, amount: -amount)
            }
            return .success(true)
        } catch JuiceMakerError.insufficientStock {
            print(JuiceMakerError.insufficientStock.errorMessage)
            return .failure(.insufficientStock)
        } catch {
            print(JuiceMakerError.unexpected.errorMessage)
            return .failure(.unexpected)
        }
    }
}
