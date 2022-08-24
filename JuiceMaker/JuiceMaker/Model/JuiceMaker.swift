//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation
// 쥬스 메이커 타입
struct JuiceMaker {
    var fruitStore = FruitStore()
    
    enum Juice {
        case strawberryJuice
        case bananaJuice
        case kiwiJuice
        case pineappleJuice
        case strawberryBananaJuice
        case mangoJuice
        case mangoKiwiJuice
        
    }
    
    let ingredientsForJuice: [Juice: [FruitStore.Fruit: Int]] =
    [.strawberryJuice: [.strawberry : 16],
     .bananaJuice: [.banana: 2],
     .kiwiJuice: [.kiwi: 3],
     .pineappleJuice: [.pineapple: 2],
     .strawberryBananaJuice: [.strawberry: 10, .banana: 1],
     .mangoJuice: [.mango: 3],
     .mangoKiwiJuice: [.mango: 2, .kiwi: 1]]
    
    func makeJuice(of juiceType: Juice) {
        if isMakeAble(to: ingredientsForJuice[juiceType]) {
            
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
