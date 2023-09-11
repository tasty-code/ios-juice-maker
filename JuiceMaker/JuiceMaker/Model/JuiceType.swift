//
//  JuiceType.swift
//  JuiceMaker
//
//  Created by imseonghyeon on 2023/09/11.
//

import Foundation

enum JuiceType {
    var ingredients: [Fruit] {
        switch self {
        case .strawberryJuice:
            return [Fruit(.strawberry, 16)]
        case .bananaJuice:
            return [Fruit(.banana, 2)]
        case .kiwiJuice:
            return [Fruit(.kiwi, 3)]
        case .pineappleJuice:
            return [Fruit(.kiwi, 3)]
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
