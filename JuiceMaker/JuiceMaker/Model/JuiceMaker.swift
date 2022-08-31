//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

typealias Recipe = (Storage: Storage, amount: Int)

struct JuiceMaker {
    
    class Juice {
        
        private(set) var recipes: [Recipe]
        let name: String
        let fruitStore = FruitStore.shared
        
        var isMakeCheck: Bool {
            for recipe in recipes {
                if recipe.Storage.amount < recipe.amount {
                    return false
                }
            }
            return true
        }
        
        init(_ recipes: [Recipe], _ name: String) {
            self.recipes = recipes
            self.name = name
        }
        
        enum JuiceRecipe {
            static let strawberry = [(fruitStore.strawberry, 16)]
            static let banana = [(fruitStore.banana, 2)]
            static let kiwi = [(fruitStore.kiwi, 3)]
            static let pineapple = [(fruitStore.pineapple, 2)]
            static let strawberryBanana = [(fruitStore.strawberry, 10), (fruitStore.banana, 1)]
            static let mango = [(fruitStore.mango, 3)]
            static let mangoKiwi = [(fruitStore.mango, 2), (fruitStore.kiwi, 1)]
        }
        
        enum JuiceType {
            static let strawberry = Juice(JuiceRecipe.strawberry, "딸기주스")
            static let banana = Juice(JuiceRecipe.banana, "바나나주스")
            static let pineapple = Juice(JuiceRecipe.pineapple, "파인애플주스")
            static let kiwi = Juice(JuiceRecipe.kiwi, "키위주스")
            static let strawberryBanana = Juice(JuiceRecipe.strawberryBanana, "딸바주스")
            static let mango = Juice(JuiceRecipe.mango, "망고주스")
            static let mangoKiwi = Juice(JuiceRecipe.mangoKiwi, "망키주스")
        }
    }
    
    func makeJuice(_ menu: Juice) {
        for recipe in menu.recipes {
            if menu.isMakeCheck {
                recipe.Storage.decreaseAmount(recipe.amount)
            }
        }
    }
}
