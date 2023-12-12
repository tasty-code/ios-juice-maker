//
//  Juice.swift
//  JuiceMaker
//
//  Created by nayeon  on 2023/12/06.
//

import Foundation

enum Juice {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
    case strawberryBanana
    case mangoKiwi
    
    var recipe: [Fruits: Int] {
        switch self {
        case .strawberry:
            return [Fruits.strawberry: 16]
        case .banana:
            return [Fruits.banana: 2]
        case .kiwi:
            return [Fruits.kiwi: 3]
        case .pineapple:
            return [Fruits.pineapple: 2]
        case .strawberryBanana:
            return [Fruits.strawberry: 10, Fruits.banana: 1]
        case .mango:
            return [Fruits.mango: 3]
        case .mangoKiwi:
            return [Fruits.mango: 2, Fruits.kiwi: 1]
        }
    }
}
