//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
    
    // MARK: - Properties
    
    let fruitStore = FruitStore()
    
    // MARK: - Methods
    
    func makeJuice(menu: JuiceMenu) throws {
        let recipe = menu.juiceRecipe()
        
        try checkStock(for: recipe)
        
        for (fruit, count) in recipe {
            fruitStore.consume(fruit: fruit, count: count)
        }
    }
    
    private func checkStock(for recipe: [Fruit: Int]) throws {
        for (fruit, count) in recipe {
            let remainCount = fruitStore.quantity(of: fruit)
            if remainCount < count {
                throw StockError.emptyStock
            }
        }
    }
}
