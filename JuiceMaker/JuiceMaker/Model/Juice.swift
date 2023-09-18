//
//  Juice.swift
//  JuiceMaker
//
//  Created by 전성수 on 2023/09/18.
//

import Foundation

enum Juice: CustomStringConvertible {
    case strawberryJuice
    case bananaJuice
    case pineappleJuice
    case kiwiJuice
    case mangoJuice
    case strawberryBananaJuice
    case mangoKiwiJuice
    
    var recipe: [Fruit : Int] {
        switch self {
        case .strawberryJuice:
            return [.strawberry : 16]
        case .bananaJuice:
            return [.banana : 2]
        case .pineappleJuice:
            return [.pineapple : 2]
        case .kiwiJuice:
            return [.kiwi : 3]
        case .mangoJuice:
            return [.mango : 3]
        case .strawberryBananaJuice:
            return [.strawberry : 10, .banana : 1]
        case .mangoKiwiJuice:
            return [.mango: 2, .kiwi : 1]
        }
    }
    
    var description: String {
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
