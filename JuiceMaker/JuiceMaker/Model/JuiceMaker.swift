//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation
// 쥬스 메이커 타입
struct JuiceMaker {
    
    enum Juice {
        case strawberryJuice = ["딸기": 1, "바나나": 2]
        case bananaJuice
        case kiwiJuice
        case pineappleJuice
        case strawberryBananaJuice
        case mangoJuice
        case mangoKiwiJuice
        
    }
    
    var fruitStore = FruitStore()
    
    func makeJuice(of: Juice) {
        
    }
    
}
