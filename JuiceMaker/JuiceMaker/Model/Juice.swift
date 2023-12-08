//
//  Juice.swift
//  JuiceMaker
//  Created by Kyle & L
//

enum Juice {
    case strawberryJuice
    case bananaJuice
    case pineappleJuice
    case kiwiJuice
    case mangoJuice
    case strawberryBananaJuice
    case mangoKiwiJuice
    
    var recipe: [Fruits:Int] {
        switch self {
        case .strawberryJuice:
            [.strawberry: 16]
        case .bananaJuice:
            [.banana: 2]
        case .pineappleJuice:
            [.pineapple: 2]
        case .kiwiJuice:
            [.kiwi: 3]
        case .mangoJuice:
            [.mango: 3]
        case .strawberryBananaJuice:
            [.strawberry: 10, .banana: 1]
        case .mangoKiwiJuice:
            [.mango: 2, .kiwi: 1]
        }
    }
}
