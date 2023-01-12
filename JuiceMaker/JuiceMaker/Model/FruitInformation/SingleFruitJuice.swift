//
//  FruitSingleJuice.swift
//  JuiceMaker
//
//  Created by 이상윤 on 2023/01/06.
//

import Foundation

enum SingleFruitJuice: String, CaseIterable, CustomStringConvertible {
    case strawberry = "딸기쥬스 주문"
    case banana = "바나나쥬스 주문"
    case kiwi = "키위쥬스 주문"
    case pineApple = "파인애플쥬스 주문"
    case mango = "망고쥬스 주문"
    
    var recipe: [Fruit: Int]{
        switch self {
        case .strawberry:
            return [.strawberry: 16]
        case .banana:
            return [.banana: 2]
        case .pineApple:
            return [.pineApple: 2]
        case .kiwi:
            return [.kiwi: 3]
        case .mango:
            return [.mango: 3]
        }
    }
    
    var description: String {
        return self.rawValue
    }
}
