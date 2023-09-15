//
//  JuiceMenu.swift
//  JuiceMaker
//
//  Created by 김진웅 on 2023/09/12.
//

import Foundation

enum JuiceMenu {
    case strawberryJuice
    case bananaJuice
    case kiwiJuice
    case pineappleJuice
    case strawberryBananaJuice
    case mangoJuice
    case mangoKiwiJuice
    
    var recipe: [Fruit: UInt] {
        switch self {
        case .strawberryJuice:
            return [Fruit.strawberry: 16]
        case .bananaJuice:
            return [Fruit.banana: 2]
        case .kiwiJuice:
            return [Fruit.kiwi: 3]
        case .pineappleJuice:
            return [Fruit.pineapple: 2]
        case .strawberryBananaJuice:
            return [Fruit.strawberry: 10, Fruit.banana: 1]
        case .mangoJuice:
            return [Fruit.mango: 3]
        case .mangoKiwiJuice:
            return [Fruit.mango: 2, Fruit.kiwi: 1]
        }
    }
    
    var recipeName: String {
        switch self {
        case .strawberryJuice:
            return "딸기"
        case .bananaJuice:
            return "바나나"
        case .kiwiJuice:
            return "키위"
        case .pineappleJuice:
            return "파인애플"
        case .strawberryBananaJuice:
            return "딸바"
        case .mangoJuice:
            return "망고"
        case .mangoKiwiJuice:
            return "망키"
        }
    }
}
