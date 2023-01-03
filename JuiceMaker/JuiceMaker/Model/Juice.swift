//
//  Juice.swift
//  JuiceMaker
//
//  Created by 조용현 on 2023/01/03.
//

import Foundation

enum Juice {
    case strawberryJuice
    case bananaJuice
    case kiwiJuice
    case pineappleJuice
    case ddalbaJuice
    case mangoJuice
    case mangkiJuice
    
    var ingredients: [Fruit: Int] {
        switch self {
        case .strawberryJuice:
            return [.strawberry: 16]
        case .bananaJuice:
            return [.banana: 2]
        case .kiwiJuice:
            return [.kiwi: 3]
        case .pineappleJuice:
            return [.pineapple: 2]
        case .ddalbaJuice:
            return [.strawberry: 10, .banana: 1]
        case .mangoJuice:
            return [.mango: 3]
        case .mangkiJuice:
            return [.mango: 2, .kiwi: 1]
        }
    }
}
