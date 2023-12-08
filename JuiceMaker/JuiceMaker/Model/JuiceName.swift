//
//  JuiceName.swift
//  JuiceMaker
//
//  Created by Taewan Kim on 12/5/23.
//

import Foundation

enum JuiceName {
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
