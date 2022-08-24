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
    
    var canMake: Bool {
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
}

enum JuiceType {
    static let strawberry = Juice(recipes.strawberry, "딸기쥬스")
    static let banana = Juice(recipes.banana, "바나나쥬스")
    static let pineapple = Juice(recipes.pineapple, "파인애플쥬스")
    static let kiwi = Juice(recipes.kiwi, "키위쥬스")
    static let strawberryBanana = Juice(recipes.strawberryBanana, "딸바쥬스")
    static let mango = Juice(recipes.mango, "망고쥬스")
    static let mangoKiwi = Juice(recipes.mangoKiwi, "망키쥬스")
}
