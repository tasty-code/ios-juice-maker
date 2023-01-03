//
//  Juice.swift
//  JuiceMaker
//
//  Created by 조용현 on 2023/01/03.
//

import Foundation

enum Juice: String {
    case strawberryJuice = "딸기쥬스"
    case bananaJuice = "바나나쥬스"
    case kiwiJuice = "키위쥬스"
    case pineappleJuice = "파인애플쥬스"
    case ddalbaJuice = "딸바쥬스"
    case mangoJuice = "망고쥬스"
    case mangkiJuice = "망고키위쥬스"
    
    var 재료: [Fruit: Int] {
        switch self {
        case .strawberryJuice:
            return [Fruit.딸기: 16]
        case .bananaJuice:
            return [Fruit.바나나: 2]
        case .kiwiJuice:
            return [Fruit.키위: 3]
        case .pineappleJuice:
            return [Fruit.파인애플: 2]
        case .ddalbaJuice:
            return [Fruit.딸기: 10, Fruit.바나나: 1]
        case .mangoJuice:
            return [Fruit.망고: 3]
        case .mangkiJuice:
            return [Fruit.망고: 2, Fruit.키위: 1]
        }
    }
}
