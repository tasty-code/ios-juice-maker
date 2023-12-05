//
//  Fruits.swift
//  JuiceMaker
//
//  Created by 강창현 on 12/4/23.
//
    
enum Fruits {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
    
    var name: String {
        switch self {
        case .strawberry:
            "딸기"
        case .banana:
            "바나나"
        case .pineapple:
            "파인애플"
        case .kiwi:
            "키위"
        case .mango:
            "망고"
        }
    }
}
