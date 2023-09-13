//
//  Juice.swift
//  JuiceMaker
//
//  Created by 김수경 on 2023/09/12.
//

import Foundation

enum Juice {
    case strawberryJuice
    case bananaJuice
    case kiwiJuice
    case pineappleJuice
    case mangoJuice
    case strawberryBananaJuice
    case mangoKiwiJuice
    
    var message: String {
        switch self {
        case .strawberryJuice:
            return "주문성공😀 주문하신 딸기쥬스 나왔습니다."
        case .bananaJuice:
            return "주문성공😀 주문하신 바나나쥬스 나왔습니다."
        case .kiwiJuice:
            return "주문성공😀 주문하신 키위쥬스 나왔습니다."
        case .pineappleJuice:
            return "주문성공😀 주문하신 파인애플쥬스 나왔습니다."
        case .mangoJuice:
            return "주문성공😀 주문하신 망고쥬스 나왔습니다."
        case .strawberryBananaJuice:
            return "주문성공😀 주문하신 딸바쥬스 나왔습니다."
        case .mangoKiwiJuice:
            return "주문성공😀 주문하신 망키쥬스 나왔습니다."
        }
    }
}

