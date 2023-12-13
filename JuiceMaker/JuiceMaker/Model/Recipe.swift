//
//  Recipe.swift
//  JuiceMaker
//
//  Created by 이보한 on 2023/12/6.
//

enum Recipe: String {
    case strawberry = "strawberry"
    case banana = "banana"
    case kiwi = "kiwi"
    case pineapple = "pineapple"
    case strawberryBanana = "strawberry,banana"
    case mango = "mango"
    case mangoKiwi = "mango,kiwi"
    
    var recipeName: String {
            switch self {
            case .strawberry:
                return "딸기"
            case .banana:
                return "바나나"
            case .kiwi:
                return "키위"
            case .pineapple:
                return "파인애플"
            case .strawberryBanana:
                return "딸바"
            case .mango:
                return "망고"
            case .mangoKiwi:
                return "망키"
            }
        }
}
