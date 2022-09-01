//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    enum FruitJuice: CaseIterable {
        case strawberry, banana, pineapple, kiwi, mango, strawberryBanana, mangoKiwi
        
        var juiceName: String {
            switch self {
            case .strawberry:
                return "딸기"
            case .banana:
                return "바나나"
            case .pineapple:
                return "파인애플"
            case .kiwi:
                return "키위"
            case .mango:
                return "망고"
            case .strawberryBanana:
                return "딸바"
            case .mangoKiwi:
                return "망키"
            }
        }
        
        var juiceRecipe: [Int] {
            switch self {
            case .strawberry:
                return [16]
            case .banana:
                return [2]
            case .pineapple:
                return [2]
            case .kiwi:
                return [3]
            case .mango:
                return [3]
            case .strawberryBanana:
                return [10, 1]
            case .mangoKiwi:
                return [2, 1]
            }
        }
    }

    enum Fruit: Int, CaseIterable {
        case strawberry, banana, pineapple, kiwi, mango
    }
    
    var fruits = [Fruit : Int]()

    
    func addStock(fruit : Fruit, stock: Int) {
        fruits[fruit]! += stock
    }
    
    func decreaseStock(fruit : Fruit, stock: Int) {
        fruits[fruit]! -= stock
    }
    
    
    init() {
        for fruit in Fruit.allCases {
            fruits[fruit] = 10
        }
    }
}
