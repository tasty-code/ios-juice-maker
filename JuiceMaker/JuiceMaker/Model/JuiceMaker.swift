//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Juice: String {
    case strawberryJuice = "딸기쥬스"
    case bananaJuice = "바나나쥬스"
    case kiwiJuice = "키위쥬스"
    case pineappleJuice = "파인애플쥬스"
    case strawberryBananaJuice = "딸바쥬스"
    case mangoJuice = "망고쥬스"
    case mangoKiwiJuice = "망키쥬스"
}

// 쥬스 메이커 타입
struct JuiceMaker {
    let fruitStore = FruitStore()
    
    var strawberryRecipe: Int = 16
    var bananaRecipe: Int = 2
    var kiwiRecipe: Int = 3
    var pineappleRecipe: Int = 2
    var strawberryBananaRecipe: [Int] = [10, 1]
    var mangoRecipe: Int = 3
    var mangoKiwiRecipe: [Int] = [2, 1]
}
