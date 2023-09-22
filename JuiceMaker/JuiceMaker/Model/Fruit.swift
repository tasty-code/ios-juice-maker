//
//  Fruit.swift
//  JuiceMaker
//
//  Created by 김수경 on 2023/09/18.
//

import Foundation
@frozen
enum Fruit: Int {
    case strawberry = 0
    case banana
    case pineapple
    case kiwi
    case mango
    
    var message: String {
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
