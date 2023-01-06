//
//  Juices.swift
//  JuiceMaker
//
//  Created by DONGWOOK SEO on 2023/01/03.
//

import Foundation

enum Juices: Int {
    case strawBanana
    case mangoKiwi
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
    
    
    var recipe: [OrderMessage] {
        switch self {
        case .strawberry:
            return [OrderMessage(fruitName: .strawberry, amount: -16)]
        case .banana:
            return [OrderMessage(fruitName: .banana, amount: -2)]
        case .kiwi:
            return [OrderMessage(fruitName: .kiwi, amount: -3)]
        case .pineapple:
            return [OrderMessage(fruitName: .pineapple, amount: -2)]
        case .strawBanana:
            return [OrderMessage(fruitName: .strawberry, amount: -10), OrderMessage(fruitName: .banana, amount: -1)]
        case .mango:
            return [OrderMessage(fruitName: .mango, amount: -3)]
        case .mangoKiwi:
            return [OrderMessage(fruitName: .mango, amount: -2), OrderMessage(fruitName: .kiwi, amount: -1)]
        }
    }
}
