//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
    let fruitStore = FruitStore.shared

    func order(juice: Menu) {
        make(juice: juice)
    }

    func make(juice order: Menu) {
        order.recipe.forEach { (fruit, quantity) in
            fruitStore.remove(fruit: fruit, quantity: quantity)
        }
    }
}
