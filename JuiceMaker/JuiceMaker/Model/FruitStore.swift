//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum Fruit: Int {
    case strawberry, banana, pineapple, kiwi, mango
}

// 과일 저장소 타입
class FruitStore {
    var strawberry: Int = 10
    var banana: Int = 10
    var pineapple: Int = 10
    var kiwi: Int = 10
    var mango: Int = 10
    
     
    func changeAmount(fruit: Fruit, amount: Int) {
        switch fruit {
        case .strawberry:
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


