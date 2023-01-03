//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    
    private let fruitStore = FruitStore.shared

    typealias Ingredients = [FruitStore.Fruits: Int]

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
                return "망키쥬스"
            }
        }
        
        var receipe: Ingredients {
            switch self {
            case .strawberry:
                return [.strawberries: 16]
            case .banana:
                return [.bananas: 2]
            case .kiwi:
                return [.kiwis: 3]
            case .pineapple:
                return [.pineapples: 2]
            case .strawberryBanana:
                return [.strawberries: 10, .bananas: 1]
            case .mango:
                return [.mangos: 3]
            case .mangoKiwi:
                return [.mangos: 2, .kiwis: 1]
            }
        }
        
    }
    
    func checkOrderable(of ingredients: Ingredients) -> Bool {
        for ingredient in ingredients {
            let eachStock = fruitStore.checkStock(of: ingredient.key)
            guard eachStock >= ingredient.value else { return false }
        }
        return true
    }
    
    // 쥬스 제조 -> 과일 저장소 재고 확인을 먼저하고, 재고 감소를 호출함
    func startBlending() {
        //fruitStore.checkStock() //쥬스 종류에 따라 매개변수 입력 (분기처리)
        fruitStore.decrease()
    }
    
}
