//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    
    private let store: FruitStore
    
    init(store: FruitStore) {
        self.store = store
        self.store.initializeFruit()
    }
    
    func order(_ recipe: Recipe) -> Result<Bool, JuiceMakerErrors> {
        do {
            try takeOrder(recipe)
        } catch JuiceMakerErrors.orderFail {
            return .failure(.orderFail)
        } catch {
            
        }
        return .success(true)
    }
    
    func takeOrder(_ kind: Recipe) throws {
        let splittedIngredientArray = kind.rawValue.split(separator: ",")
        if splittedIngredientArray.count == 1 {
            guard let fruitsStock = store.fruits[String(splittedIngredientArray[0])],
                  let recipe = store.recipes[String(splittedIngredientArray[0])],
                    fruitsStock >= recipe[0]
            else {
                throw JuiceMakerErrors.orderFail
            }
            store.fruits[String(splittedIngredientArray[0])] = fruitsStock - recipe[0]
            store.fruitsFlag[String(splittedIngredientArray[0])] = true
        } else {
            try splittedIngredientArray.enumerated().forEach { index, fruit in
                guard let fruitsStock = store.fruits[String(fruit)],
                      let recipe = store.recipes[kind.rawValue],
                      fruitsStock >= recipe[index] else {
                    throw JuiceMakerErrors.orderFail
                }
                store.fruits[String(fruit)] = fruitsStock - recipe[index]
                store.fruitsFlag[String(fruit)] = true
            }
        }
    }
}
