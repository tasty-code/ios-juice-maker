//
//  FruitJuice.swift
//  JuiceMaker
//
//  Created by 김경록 on 2023/09/12.
//

import Foundation

@frozen
enum FruitJuice: Int, CustomStringConvertible {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
    case strawberryBanana
    case mangoKiwi
     
    var description: String {
        switch self {
        case .strawberry: return "딸기"
        case .banana: return "바나나"
        case .pineapple: return "파인애플"
        case .kiwi: return "키위"
        case .mango: return "망고"
        case .strawberryBanana: return "딸기바나나"
        case .mangoKiwi: return "망고키위"
        }
    }
}
