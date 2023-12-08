//
//  JuiceMenu.swift
//  JuiceMaker
//
//  Created by yujaehong on 12/8/23.
//

import Foundation

enum JuiceMenu: String, CustomStringConvertible {
    case strawberry = "딸기 쥬스"
    case banana = "바나나 쥬스"
    case pineapple = "파인애플 쥬스"
    case kiwi = "키위 쥬스"
    case mango = "망고 쥬스"
    case strawberryBanana = "딸바 쥬스"
    case mangoKiwi = "망키 쥬스"
    
    var description: String {
        self.rawValue
    }
    
    func receiveRecipes() -> [(requiredFruit: Fruit, requestedAmount: Int)] {
        var recipe: [(Fruit, Int)]
        
        switch self {
        case .strawberry:
            recipe = [(.strawberry, 16)]
        case .banana:
            recipe = [(.banana, 2)]
        case .kiwi:
            recipe = [(.kiwi, 3)]
        case .pineapple:
            recipe = [(.pineapple, 2)]
        case .mango:
            recipe = [(.mango, 3)]
        case .strawberryBanana:
            recipe = [(.strawberry, 10), (.banana, 1)]
        case .mangoKiwi:
            recipe = [(.mango, 2), (.kiwi, 1)]
        }
        return recipe
    }
}
