//
//  FruitTagEnum.swift
//  JuiceMaker
//
//  Created by 권태호 on 19/12/2023.
//

import Foundation

enum FruitTag: Int {
    case strawberryBanana = 1
    case mangoKiwi = 2
    case strawberry = 3
    case banana = 4
    case pineapple = 5
    case kiwi = 6
    case mango = 7
    
    var rawValueIsInt: Int {
        switch self {
        case .strawberryBanana:
            return 1
        case .mangoKiwi:
            return 2
        case .strawberry:
            return 3
        case .banana:
            return 4
        case .pineapple:
            return 5
        case .kiwi:
            return 6
        case .mango:
            return 7
        }
    }
    
    
}


