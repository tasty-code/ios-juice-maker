//
//  Fruits.swift
//  JuiceMaker
//
//  Created by 박재우 on 2023/01/03.
//

import Foundation

enum Fruits: Int, CaseIterable {
    case strawberry = 0
    case banana
    case pineapple
    case kiwi
    case mango
}

extension Fruits {
    var koreanName: String {
        switch self {
        case .strawberry:
            return "딸기"
        case .banana:
            return "바나나"
        case .pineapple:
            return "파인애플"
        case .kiwi:
            return "키위"
        case .mango:
            return "망고"
        }
    }
}
