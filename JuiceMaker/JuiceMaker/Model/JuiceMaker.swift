//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation
// 쥬스 메이커 타입
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
    //쥬스 제작 시작 함수
    func makeJuice(to menu: Juice) {
        //재료가 충분하지 않을 시 함수가 종료됨
        if isMakeAble(juice: menu) == false {
            return
        }
        
        //재료를 소모하는 함수 실행
        useIngredients(of: menu)
    }
    //지정한 메뉴를 만들 재료가 충분한지 반환하는 함수
    func isMakeAble(juice: Juice) -> Bool {
        for ingredients in juice.recipe {
            let demandFruitType: FruitStore.Fruit = ingredients.key
            
            if fruitStore.getAmount(of: demandFruitType) < ingredients.value {
                return false
            }
        }
        
        return true
    }
    //지정한 메뉴의 재료를 소모하는 함수
    func useIngredients(of menu: Juice) {
        for ingredients in menu.recipe {
            let demandFruitType: FruitStore.Fruit = ingredients.key
            fruitStore.decrease(of: demandFruitType, to: ingredients.value)
        }
    }
}
