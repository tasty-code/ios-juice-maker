//
//  FruitType.swift
//  JuiceMaker
//
//  Created by MAC2020 on 2023/12/06.
//

import Foundation

enum Fruit {
    case strawberry
    case banana
    case kiwi
    case pineapple
    case mango
    
    var fruitName:String {
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

