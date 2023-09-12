//
//  JuiceType.swift
//  JuiceMaker
//
//  Created by Swain Yun on 2023/09/12.
//

import Foundation

@frozen enum JuiceType {
    case strawberryJuice, bananaJuice, kiwiJuice, pineappleJuice, strawberryBananaMixJuice, mangoJuice, mangokiwiJuice
    
    var recipe: [Fruit] {
        switch self {
        case .strawberryJuice:
            return [Fruit(.strawberry, 16)]
        case .bananaJuice:
            return [Fruit(.banana, 2)]
        case .kiwiJuice:
            return [Fruit(.kiwi, 3)]
        case .pineappleJuice:
            return [Fruit(.pineapple, 2)]
        case .strawberryBananaMixJuice:
            return [Fruit(.strawberry, 10), Fruit(.banana, 1)]
        case .mangoJuice:
            return [Fruit(.mango, 3)]
        case .mangokiwiJuice:
            return [Fruit(.mango, 2), Fruit(.kiwi, 1)]
        }
    }
}
