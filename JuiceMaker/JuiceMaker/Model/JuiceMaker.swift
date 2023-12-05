//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    enum Menu {
        case 딸기쥬스, 바나나쥬스, 키위쥬스, 파인애플쥬스, 딸바쥬스, 망고쥬스, 망고키위쥬스
    }
    
    var fruitStore = FruitStore()
    
    func makeJuice(menu: Menu) {
        switch menu {
        case .딸기쥬스:
            fruitStore.consumeFruit(ofType: .strawberry, amount: 16)
        case .바나나쥬스:
            fruitStore.consumeFruit(ofType: .banana, amount: 2)
        case .키위쥬스:
            fruitStore.consumeFruit(ofType: .kiwi, amount: 3)
        case .파인애플쥬스:
            fruitStore.consumeFruit(ofType: .pineapple, amount: 2)
        case .딸바쥬스:
            fruitStore.consumeFruit(ofType: .strawberry, amount: 10)
            fruitStore.consumeFruit(ofType: .banana, amount: 1)
        case .망고쥬스:
            fruitStore.consumeFruit(ofType: .mango, amount: 3)
        case .망고키위쥬스:
            fruitStore.consumeFruit(ofType: .mango, amount: 2)
            fruitStore.consumeFruit(ofType: .kiwi, amount: 1)
        }
    }
}
