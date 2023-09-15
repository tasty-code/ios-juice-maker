//
//  JuiceType.swift
//  JuiceMaker
//
//  Created by imseonghyeon on 2023/09/11.
//

import Foundation

enum JuiceType: String {
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

    case strawberryJuice = "딸기쥬스"
    case bananaJuice = "바나나쥬스"
    case kiwiJuice = "키위쥬스"
    case pineappleJuice = "파인애플쥬스"
    case strawberrydBananaJuice = "딸바쥬스"
    case mangoJuice = "망고쥬스"
    case mangoKiwiJuice = "망키쥬스"
}
