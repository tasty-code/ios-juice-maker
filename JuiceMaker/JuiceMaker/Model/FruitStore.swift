//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum FruitType {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
}

class FruitStore {
    let stock: Int = 10
        
        func changeStock(fruit: FruitType, change: Int) -> Int {
            switch fruit {
            case .strawberry:
                return stock + change
            case .banana:
                return stock + change
            case .pineapple:
                return stock + change
            case .kiwi:
                return stock + change
            case .mango:
                return stock + change
            }
        }
}
