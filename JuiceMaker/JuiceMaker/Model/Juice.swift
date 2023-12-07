//
//  Juice.swift
//  JuiceMaker
//
//  Created by 미르 & 미성
//

enum Juice {
    case strawberryJuice
    case bananaJuice
    case pineappleJuice
    case kiwiJuice
    case mangoJuice
    case strawberryBananaJuice
    case mangoKiwiJuice
    
    var name: String {
        switch self {
        case .strawberryJuice:
            "딸기쥬스"
        case .bananaJuice:
            "바나나쥬스"
        case .pineappleJuice:
            "파인애플쥬스"
        case .kiwiJuice:
            "키위쥬스"
        case .mangoJuice:
            "망고쥬스"
        case .strawberryBananaJuice:
            "딸바쥬스"
        case .mangoKiwiJuice:
            "망고키위쥬스"
        }
    }
    
    var recipe: [Fruit: UInt] {
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
