//
//  FruitSingleJuice.swift
//  JuiceMaker
//
//  Created by 이상윤 on 2023/01/06.
//

import Foundation

enum FruitSingleJuice: CaseIterable {
    case strawberry
    case banana
    case kiwi
    case pineApple
    case mango
    
    var recipe: [FruitList: Int]{
        switch self {
        case .strawberry:
            return [.strawberry: 16]
        case .banana:
            return [.banana: 2]
        case .kiwi:
            return [.kiwi: 3]
        case .pineApple:
            return [.pineApple: 2]
        case .mango:
            return [.mango: 3]
        }
    }
}
