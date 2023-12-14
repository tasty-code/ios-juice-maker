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
            try checkStockAvailability(for: recipe)
            try reduceStock(for: recipe)
            return .success(true)
        } catch JuiceMakerError.insufficientStock {
            print(JuiceMakerError.insufficientStock.errorMessage)
            return .failure(.insufficientStock)
        } catch {
            print(JuiceMakerError.unexpected.errorMessage)
            return .failure(.unexpected)
        }
    }

    private func checkStockAvailability(for recipe: [Fruits: Int]) throws {
        guard fruitStore.checkStockAvailability(recipe: recipe) else {
            throw JuiceMakerError.insufficientStock
        }
    }

    private func reduceStock(for recipe: [Fruits: Int]) throws {
        for (fruit, amount) in recipe {
            fruitStore.changeStock(fruitName: fruit, amount: -amount)
        }
    }
}
