//
//  JuiceRecipe.swift
//  JuiceMaker
//
//  Created by 권태호 on 05/12/2023.
//

import Foundation

enum JuiceRecipe {
    case strawberry
    case banana
    case kiwi
    case pineapple
    case strawberryBanana
    case mango
    case mangoKiwi
    
    var name: String {
        switch self {
        case .strawberry: 
            return "딸기쥬스"
        case .banana:
            return "바나나쥬스"
        case .kiwi:
            return "키위쥬스"
        case .pineapple: 
            return "파인애플쥬스"
        case .strawberryBanana:
            return "딸바쥬스"
        case .mango: 
            return "망고쥬스"
        case .mangoKiwi: 
            return "망고키위쥬스"
        }
    }
    
    var ingredients: [String: Int] {
        switch self {
        case .strawberry: 
            return ["딸기": 16]
        case .banana: 
            return ["바나나": 2]
        case .kiwi: 
            return ["키위": 3]
        case .pineapple: 
            return ["파인애플": 2]
        case .strawberryBanana: 
            return ["딸기": 10, "바나나": 1]
        case .mango: 
            return ["망고": 3]
        case .mangoKiwi: 
            return ["망고": 2, "키위": 1]
        }
    }
}
