//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
    func makeJuice(_ menu: Juice) {
        for recipe in menu.recipes {
            if menu.isMakeCheck {
                recipe.Storage.minusAmount(recipe.amount)
            }
        }
    }
}
