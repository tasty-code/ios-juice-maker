//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

class JuiceMaker {
    enum Juice {
        case strawberry
        case banana
        case kiwi
        case pineapple
        case strawberryBanana
        case mango
        case mangoKiwi
        
        var name: String {
            switch self {
            case .strawberry:
                return "딸기쥬스"
            case .banana:
                return "바나나쥬스"
            case .kiwi:
                return "키위쥬스"
            case .pineapple:
                return "파인애플쥬스"
            case .strawberryBanana:
                return "딸바쥬스"
            case .mango:
                return "망고쥬스"
            case .mangoKiwi:
                return "망고키위쥬스"
            }
        }
        
        var recipe: [FruitStore.Fruit: Int] {
            switch self {
            case .strawberry:
                return [.strawberry: 16]
            case .banana:
                return [.banana: 2]
            case .kiwi:
                return [.kiwi: 3]
            case .pineapple:
                return [.pineapple: 2]
            case .strawberryBanana:
                return [.strawberry: 10, .banana: 1]
            case .mango:
                return [.mango: 3]
            case .mangoKiwi:
                return [.mango: 2, .kiwi: 1]
            }
        }
    }
    
    var fruitStore = FruitStore()
    
    func makeJuice(to menu: Juice) {
        if isMakeAble(juice: menu) == false {
            return
        }
        
        useIngredients(of: menu)
    }
    
    func isMakeAble(juice: Juice) -> Bool {
        for ingredients in juice.recipe {
            let demandFruitType: FruitStore.Fruit = ingredients.key
            
            if fruitStore.getAmount(of: demandFruitType) < ingredients.value {
                return false
            }
        }
        
        return true
    }
    
    func useIngredients(of menu: Juice) {
        for ingredients in menu.recipe {
            let demandFruitType: FruitStore.Fruit = ingredients.key
            fruitStore.decrease(of: demandFruitType, to: ingredients.value)
        }
    }
}
