//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
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
                return "딸기 주스"
            case .banana:
                return "바나나 주스"
            case .kiwi:
                return "키위 주스"
            case .pineapple:
                return "파인애플 주스"
            case .strawberryBanana:
                return "딸기바나나 주스"
            case .mango:
                return "망고 주스"
            case .mangoKiwi:
                return "망고키위 주스"
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
    let fruitStore = FruitStore()
    
    func canMake(_ juice: JuiceMaker.Juice) -> Bool {
        var hasFruitAmount = true
        for recipe in juice.recipe {
            guard let amount: Int = fruitStore.fruits[recipe.key] else { return false }
            hasFruitAmount = hasFruitAmount && amount >= recipe.value
            
        }
        return hasFruitAmount
    }
    
    func makeJuice(_ juice: Juice) {
        if canMake(juice) {
            fruitStore.decrease(juice.recipe)
        }
    }
}
