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
        
        var recipe: [FruitStore.Fruit: Int] {
            switch self {
            case .딸기쥬스:
                return [.strawberry: 16]
            case .바나나쥬스:
                return [.banana: 2]
            case .키위쥬스:
                return [.kiwi: 3]
            case .파인애플쥬스:
                return [.pineapple: 2]
            case .딸바쥬스:
                return [.strawberry: 10, .banana: 1]
            case .망고쥬스:
                return [.mango: 3]
            case .망고키위쥬스:
                return [.mango: 2, .kiwi: 1]
            }
        }
    }
    
    private let fruitStore = FruitStore.shared
    
    func makeJuice(menu: Menu) {
        do {
            try fruitStore.consume(fruits: menu.recipe)
        } catch {
            print(error)
        }
    }
}
