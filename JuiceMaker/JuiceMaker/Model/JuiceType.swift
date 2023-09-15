//
//  JuiceType.swift
//  JuiceMaker
//
//  Created by imseonghyeon on 2023/09/11.
//

import Foundation

enum JuiceType {
    var name: String {
        switch self {
        case .strawberryJuice:
            return "딸기 쥬스"
        case .bananaJuice:
            return "바나나 쥬스"
        case .kiwiJuice:
            return "키위 쥬스"
        case .pineappleJuice:
            return "파인애플 쥬스"
        case .strawberrydBananaJuice:
            return "딸바 쥬스"
        case .mangoJuice:
            return "망고 쥬스"
        case .mangoKiwiJuice:
            return "망키 쥬스"
        }
    }
    
    var ingredients: [Fruit] {
        switch self {
        case .strawberryJuice:
            return [Fruit(.strawberry, 16)]
        case .bananaJuice:
            return [Fruit(.banana, 2)]
        case .kiwiJuice:
            return [Fruit(.kiwi, 3)]
        case .pineappleJuice:
            return [Fruit(.pineapple, 2)]
        case .strawberrydBananaJuice:
            return [Fruit(.strawberry, 10), Fruit(.banana, 1)]
        case .mangoJuice:
            return [Fruit(.mango, 3)]
        case .mangoKiwiJuice:
            return [Fruit(.mango, 2), Fruit(.kiwi, 1)]
        }
    }

    case strawberryJuice
    case bananaJuice
    case kiwiJuice
    case pineappleJuice
    case strawberrydBananaJuice
    case mangoJuice
    case mangoKiwiJuice
}
