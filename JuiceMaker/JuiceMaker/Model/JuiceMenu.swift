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
}

