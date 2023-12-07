//
//  JuiceMaker - JuiceMaker.swift
//  Created by 미르 & 미성
//  Copyright © yagom academy. All rights reserved.
// 

struct JuiceMaker {
    private(set) var fruitStore = FruitStore.shared
    
    init() {}
    
    func checkJuice(juice: Juice) throws {
        for (fruitName, quantity) in juice.recipe {
            try fruitStore.checkStock(fruit: fruitName, num: quantity)
        }
    }
    
    func orderJuice(juice: Juice) throws {
        try checkJuice(juice: juice)
        
        for (fruitName, quantity) in juice.recipe {
            try fruitStore.consumeFruit(fruit: fruitName, num: quantity)
        }
    }
    
    func checkJuiceRecipe(juiceName: String) -> Juice? {
        let juiceRecipes = Juice.allCases.map { $0 }
        for juiceRecipe in juiceRecipes {
            if juiceName == juiceRecipe.name {
                return juiceRecipe
            }
        }
        return nil
    }
}
