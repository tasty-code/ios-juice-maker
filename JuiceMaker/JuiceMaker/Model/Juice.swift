//
//  Juicew.swift
//  JuiceMaker
//
//  Created by 정재근 on 2022/08/24.
//

import Foundation

typealias recipe = (Storage: Storage, amount: Int)

class Juice {
    private(set) var recipes: [recipe]
    let name: String
    
    var isMakeCheck: Bool {
        for recipe in recipes {
            if recipe.Storage.amount < recipe.amount {
                return false
            }
        }
        return true
    }
    
    init(_ recipes: [recipe], _ name: String) {
        self.recipes = recipes
        self.name = name
    }
    
    enum Recipes {
        static let strawberry = [(Fruit.strawberry, 16)]
        static let banana = [(Fruit.banana, 2)]
        static let kiwi = [(Fruit.kiwi, 3)]
        static let pineapple = [(Fruit.pineapple, 2)]
        static let strawberryBanana = [(Fruit.strawberry, 10), (Fruit.banana, 1)]
        static let mango = [(Fruit.mango, 3)]
        static let mangoKiwi = [(Fruit.mango, 2), (Fruit.kiwi, 1)]
    }
    
    enum JuiceType {
        static let strawberry = Juice(Recipes.strawberry, "딿기주스")
        static let banana = Juice(Recipes.banana, "바나나주스")
        static let pineapple = Juice(Recipes.pineapple, "파인애플주스")
        static let kiwi = Juice(Recipes.kiwi, "키위주스")
        static let strawberryBanana = Juice(Recipes.strawberryBanana, "딸바주스")
        static let mango = Juice(Recipes.mango, "망고주스")
        static let mangoKiwi = Juice(Recipes.mangoKiwi, "망키주스")
    }
}


