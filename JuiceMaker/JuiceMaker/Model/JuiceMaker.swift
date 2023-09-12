//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation


struct JuiceMaker {
    
    let fruitStore: FruitStore
    
    func checkStock(inputFruit: FruitStore.Fruit, decreaseCount: Int) throws{
        guard inputFruit.stock > decreaseCount else {throw Errorcase.outOfStock}
    }
    
    
    
    
    
    func recipeCount(juice: String) throws -> Int{
        guard let confirmJuice = Recipe(rawValue: juice) else { throw Errorcase.canNotFound }
        return confirmJuice.dereaseCount
        
    }
    
    
    enum Recipe: String {
        case strawberryJuice = "딸기 주스"
        case bananaJuice = "바나나 주스"
        case pineappleJuice = "파인애플 주스"
        case mangoJuice = "망고 주스"
        case kiwiJuice = "키위 주스"
        var dereaseCount: Int {
            switch self {
            case .strawberryJuice: return 16
            case .bananaJuice, .pineappleJuice: return 2
            case .mangoJuice, .kiwiJuice: return 3
            }
        }
    }
}




