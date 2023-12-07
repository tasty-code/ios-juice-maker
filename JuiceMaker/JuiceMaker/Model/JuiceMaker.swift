//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    private var fruitStore = FruitStore()
    
    mutating func makeJuice(juice: Juice) {
        do {
            print(fruitStore.fruitStock)
            let recipe = juice.recipe
            guard fruitStore.checkStockAvailability(recipe: recipe) else {
                throw JuiceMakerError.insufficientStock
            }
            
            for (fruit, amount) in recipe {
                fruitStore.changeStock(fruitName: fruit, amount: -amount)
            }
        } catch JuiceMakerError.insufficientStock {
            print(JuiceMakerError.insufficientStock.rawValue)
        } catch {
            print(JuiceMakerError.unexpected.rawValue)
        }
    }
}
