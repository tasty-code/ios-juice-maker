//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation
// 쥬스 메이커 타입
class JuiceMaker {
    enum Juice {
//        static let strawberryJuice = ["strawberry": 16]
//        static let bananaJuice = ["banana": 2]
//        static let kiwiJuice = ["kiwi": 3]
//        static let pineappleJuice = ["pineapple": 2]
//        static let strawberryBananaJuice = ["strawberry": 10, "banana": 1]
//        static let mangoJuice = ["mango": 3]
//        static let mangoKiwiJuice = ["mango": 2, "kiwi": 1]
        
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
    
    
    func makeJuice(of optionalJuiceRecipe: [String: Int]?) {
        guard let juiceRecipe = optionalJuiceRecipe else {
            return
        }
        
        
        
    }
    
    
    func juiceMakeAble(recipes: Juice) {
        if recipes.recipe
    }
   
    
   
    
}
