//
//  Fruit.swift
//  JuiceMaker
//
//  Created by Wonji Ha on 2023/09/12.
//

import Foundation

enum Fruit {
    case strawberry
    case banana
    case kiwi
    case pineapple
    case mango
    
    static func identifyFruit(labelIdentifier: String) throws -> Fruit {
        switch labelIdentifier {
        case "딸기":
            return .strawberry
        case "바나나":
            return .banana
        case "파인애플":
            return .pineapple
        case "키위":
            return .kiwi
        case "망고":
            return .mango
        default:
            throw InventoryError.invalidError
        }
    }
}
