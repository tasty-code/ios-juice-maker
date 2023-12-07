//
//  Juice.swift
//  JuiceMaker
//
//  Created by 박재형 on 12/7/23.
//

import Foundation

enum Juice: String {
    case strawberryJuice
    case bananaJuice
    case pineappleJuice
    case kiwiJuice
    case mangoJuice
    case strawberryBananaJuice
    case mangoKiwiJuice
    
    var juice: String {
        switch self {
        case .strawberryJuice:
            return "딸기쥬스"
        case .bananaJuice:
            return "바나나쥬스"
        case .pineappleJuice:
            return "파인애플쥬스"
        case .kiwiJuice:
            return "키위쥬스"
        case .mangoJuice:
            return "망고쥬스"
        case .strawberryBananaJuice:
            return "딸기바나나쥬스"
        case .mangoKiwiJuice:
            return "망고키위쥬스"
        }
    }
}
