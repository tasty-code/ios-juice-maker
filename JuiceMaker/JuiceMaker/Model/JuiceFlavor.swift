//
//  JuiceFlavor.swift
//  JuiceMaker
//
//  Created by Effie on 12/4/23.
//

enum JuiceFlavor {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
    case strawberryBanana
    case mangoKiwi
    
    var recipe: JuiceIngredients {
        switch self {
        case .strawberry:
            return [.strawberry: 16]
        case .banana:
            return [.banana: 2]
        case .pineapple:
            return [.pineapple: 2]
        case .kiwi:
            return [.kiwi: 3]
        case .mango:
            return [.mango: 3]
        case .strawberryBanana:
            return [.strawberry: 10, .banana: 1]
        case .mangoKiwi:
            return [.mango: 2, .kiwi: 1]
        }
    }
    
    var name: String {
        switch self {
        case .strawberry: return "딸기"
        case .banana: return "바나나"
        case .pineapple: return "파인애플"
        case .kiwi: return "키위"
        case .mango: return "망고"
        case .strawberryBanana: return "딸바"
        case .mangoKiwi: return "망키"
        }
    }
}

typealias JuiceIngredients = [Fruit: Int]
