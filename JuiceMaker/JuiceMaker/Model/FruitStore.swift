//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    
    enum Fruits {
        case starawberry, banana, pineapple, kiwi, mango
    }
    
    var strawberry: Int = 10
    var banana: Int = 10
    var pineapple: Int = 10
    var kiwi: Int = 10
    var mango: Int = 10
    
    func changeAmount(fruit: Fruits, amount: Int) {
        switch fruit {
        case .starawberry:
            strawberry = amount
        case .banana:
            banana = amount
        case .pineapple:
            pineapple = amount
        case .kiwi:
            kiwi = amount
        case .mango:
            mango = amount
        }
    }
    
}
