//
//  Fruit.swift
//  JuiceMaker
//
//  Created by Wonji Ha on 2023/09/12.
//

import Foundation

enum Fruit: String {
    case strawberry = "딸기"
    case banana = "바나나"
    case kiwi = "키위"
    case pineapple = "파인애플"
    case mango = "망고"
    
    init?(_ fruit: String) throws {
        switch fruit {
        case Fruit.strawberry.rawValue:
            self = Fruit.strawberry
        case Fruit.banana.rawValue:
            self = Fruit.banana
        case Fruit.pineapple.rawValue:
            self = Fruit.pineapple
        case Fruit.kiwi.rawValue:
            self = Fruit.kiwi
        case Fruit.mango.rawValue:
            self = Fruit.mango
        default:
            throw InventoryError.invalidError
        }
    }
}
