//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
    var fruitStore: FruitStore = FruitStore.shared
    
    func isEnough(juiceMenu: JuiceMenu) -> Bool {
        var stockCheck: Bool = true
        for (fruit, count) in juiceMenu.recipe {
            guard fruitStore.checkStock(fruit: fruit, count: count) else {
                stockCheck = false
                break
            }
        }
        return stockCheck
    }
    
    mutating func makeJuice(juiceMenu: JuiceMenu) -> Juice? {
        guard isEnough(juiceMenu: juiceMenu) else {
            return nil
        }
        
        juiceMenu.recipe.forEach { (fruit: Fruit, count: Int) in
            fruitStore.release(fruit: fruit, count: count)
        }
        
        return Juice(juiceMenu: juiceMenu)
    }

}
