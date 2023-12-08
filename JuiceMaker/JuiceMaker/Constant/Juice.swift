//
//  Juice.swift
//  JuiceMaker
//
//  Created by EUNJU on 2023/12/05.
//

import Foundation

@frozen
enum Juice: String {
    case strawberry = "딸기쥬스 주문"
    case banana = "바나나쥬스 주문"
    case kiwi = "키위쥬스 주문"
    case pineapple = "파인애플쥬스 주문"
    case strawberryBanana = "딸바쥬스 주문"
    case mango = "망고쥬스 주문"
    case mangoKiwi = "망키쥬스 주문"
    
    /// 쥬스 제조 시 필요한 과일 수량 반환하는 메서드
    func checkFruitQuantity() -> [Fruit: Int] {
        switch self {
        case .strawberry:
            return [.strawberry: 16]
        case .banana:
            return [.banana: 2]
        case .kiwi:
            return [.kiwi: 3]
        case .pineapple:
            return [.pineapple: 2]
        case .strawberryBanana:
            return [.strawberry: 10, .banana: 1]
        case .mango:
            return [.mango: 3]
        case .mangoKiwi:
            return [.mango: 2, .kiwi: 1]
        }
    }
}
