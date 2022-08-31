//
//  Juicew.swift
//  JuiceMaker
//
//  Created by 정재근 on 2022/08/24.
//

import Foundation

typealias Recipe = (Storage: Storage, amount: Int)

class Juice {
    private(set) var recipes: [Recipe]
    let name: String
    
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
        static let strawberry = [(Fruit.strawberry, 16)]
        static let banana = [(Fruit.banana, 2)]
        static let kiwi = [(Fruit.kiwi, 3)]
        static let pineapple = [(Fruit.pineapple, 2)]
        static let strawberryBanana = [(Fruit.strawberry, 10), (Fruit.banana, 1)]
        static let mango = [(Fruit.mango, 3)]
        static let mangoKiwi = [(Fruit.mango, 2), (Fruit.kiwi, 1)]
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


