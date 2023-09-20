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
        
        for (fruit, count) in recipe {
            let remainCount = fruitStore.quantity(of: fruit)
            
            if remainCount < count {
                throw StockError.emptyStock
            }
            fruitStore.consume(fruit: fruit, count: count)
        }
    }
}
