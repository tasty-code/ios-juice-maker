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

    enum Fruit: CaseIterable {
        case strawberry, banana, pineapple, kiwi, mango
    }
    
    var strawberry: Int = 10
    var banana: Int = 10
    var pineapple: Int = 10
    var kiwi: Int = 10
    var mango: Int = 10
    
    func addStock(strawberry: Int = 0, banana: Int = 0, pineapple: Int = 0, kiwi: Int = 0, mango: Int = 0) {
        self.strawberry += strawberry
        self.banana += banana
        self.pineapple += pineapple
        self.kiwi += kiwi
        self.mango += mango
    }
    
    func decreaseStock(strawberry: Int = 0, banana: Int = 0, pineapple: Int = 0, kiwi: Int = 0, mango: Int = 0) {
        self.strawberry -= strawberry
        self.banana -= banana
        self.pineapple -= pineapple
        self.kiwi -= kiwi
        self.mango -= mango
    }
}
