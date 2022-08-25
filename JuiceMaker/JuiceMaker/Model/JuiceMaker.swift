//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation
// 쥬스 메이커 타입
class JuiceMaker {
    enum Recipe {
        static let strawberryJuice = ["strawberry": 16]
        static let bananaJuice = ["banana": 2]
        static let kiwiJuice = ["kiwi": 3]
        static let pineappleJuice = ["pineapple": 2]
        static let strawberryBananaJuice = ["strawberry": 10, "banana": 1]
        static let mangoJuice = ["mango": 3]
        static let mangoKiwiJuice = ["mango": 2, "kiwi": 1]
        
    }
    
    
    func makeJuice(of optionalJuiceRecipe: [String: Int]?) {
        guard let juiceRecipe = optionalJuiceRecipe else {
            return
        }
    }
    
    func isMakeAble(to optionalIngredients: [FruitStore.Fruit: Int]?) -> Bool {
        guard let ingredients = optionalIngredients else {
            return false
        }
        for demandFruitAmount in ingredients {
            let currentIngredients: FruitStore.Fruit = demandFruitAmount.key
            let storesFruitAmount = fruitStore.fruits[currentIngredients]
            
            if demandFruitAmount.value > storesFruitAmount ?? 0 {
                return false
            }
        }
        
        return true
    }
    
}
