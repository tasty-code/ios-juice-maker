//
//  JuiceMenu.swift
//  JuiceMaker
//
//  Created by 이주상 on 2023/12/08.
//

import Foundation

enum JuiceMenu {
    case strawberry
    case banana
    case kiwi
    case pineapple
    case straberryBanana
    case mango
    case mangoKiwi
    
    var recipe: [FruitName: Int] {
        switch self {
        case .strawberry:
            return [.strawberry: 16]
        case .banana:
            return [.banana: 2]
        case .kiwi:
            return [.kiwi: 3]
        case .pineapple:
            return [.pineapple: 2]
        case .straberryBanana:
            return [.strawberry: 10, .banana: 1]
        case .mango:
            return [.mango: 3]
        case .mangoKiwi:
            return [.mango: 2, .kiwi: 1]
        }
    }
}
