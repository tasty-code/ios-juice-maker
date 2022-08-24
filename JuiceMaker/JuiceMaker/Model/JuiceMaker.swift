//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Juice: String {
    case strawberryJuice = "딸기쥬스"
    case bananaJuice = "바나나쥬스"
    case kiwiJuice = "키위쥬스"
    case pineappleJuice = "파인애플쥬스"
    case strawberryBananaJuice = "딸바쥬스"
    case mangoJuice = "망고쥬스"
    case mangoKiwiJuice = "망키쥬스"
}

enum JuiceRecipe {
    static let strawberryRecipe: [Fruit: Int] = [Fruit.strawberry : 16]
    static let bananaRecipe: [Fruit: Int] = [Fruit.banana: 2]
    static let kiwiRecipe: [Fruit: Int] = [Fruit.kiwi: 3]
    static let pineappleRecipe: [Fruit: Int] = [Fruit.pineapple: 2]
    static let strawberryBananaRecipe: [Fruit: Int] = [Fruit.strawberry: 10, Fruit.banana: 1]
    static let mangoRecipe: [Fruit: Int] = [Fruit.mango: 3]
    static let mangoKiwiRecipe: [Fruit: Int] = [Fruit.mango: 2, Fruit.kiwi: 1]
}

// 쥬스 메이커 타입
struct JuiceMaker {
    let fruitStore = FruitStore()
    
    func compareFruitStock(_ juiceRecipe: [Fruit: Int]) {
        for (key, value) in juiceRecipe {
            switch key {
            case .strawberry:
                if fruitStore.strawberry >= value {
                    fruitStore.changeFruitStock(.strawberry, -value)
                }
            case .banana:
                if fruitStore.banana >= value {
                    fruitStore.changeFruitStock(.banana, -value)
                }
            case .pineapple:
                if fruitStore.pineapple >= value {
                    fruitStore.changeFruitStock(.pineapple, -value)
                }
            case .kiwi:
                if fruitStore.kiwi >= value {
                    fruitStore.changeFruitStock(.kiwi, -value)
                }
            case .mango:
                if fruitStore.mango >= value {
                    fruitStore.changeFruitStock(.mango, -value)
                }
            }
        }
    }
}
