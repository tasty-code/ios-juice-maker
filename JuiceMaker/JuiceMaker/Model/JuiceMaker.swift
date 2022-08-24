//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
    func makeJuice(_ menu: Juice) {
        for recipe in menu.recipes {
            print(recipe.amount)
                recipe.Storage.minusAmount(recipe.amount)
            print(recipe.Storage.amount)
        }
    }
}
