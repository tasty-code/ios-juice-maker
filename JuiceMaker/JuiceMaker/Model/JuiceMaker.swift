//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    let makeJuice: FruitStore = FruitStore()
    
    func isEnouph(juiceMenu: JuiceMenu) -> Bool {
        var stockCheck: Bool = true
        for (fruit, count) in juiceMenu.recipe {
            guard makeJuice.checkStock(fruit: fruit, count: count) else {
                stockCheck = false
                break
            }
        }
        return stockCheck
    }
    
}
