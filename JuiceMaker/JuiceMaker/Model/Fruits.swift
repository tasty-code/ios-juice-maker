//
//  Fruits.swift
//  JuiceMaker
//
//  Created by 박재우 on 2023/01/03.
//

import Foundation

enum Fruits: String, CaseIterable {
    case strawberry
    case banana
    case kiwi
    case pineapple
    case mango

    var koreanName: String {
        switch self {
        case .strawberry:
            return "딸기"
        case .banana:
            return "바나나"
        case .kiwi:
            return "키위"
        case .pineapple:
            return "파인애플"
        case .mango:
            return "망고"
        }
    }
}
