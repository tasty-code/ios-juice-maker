//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum Fruit {
    case strawberry, banana, pineapple, kiwi, mango
}

// 과일 저장소 타입
class FruitStore {
    var strawberry:Int = 10
    var banana:Int = 10
    var pineapple:Int = 10
    var kiwi:Int = 10
    var mango:Int = 10
    
    func changeFruitStock(_ fruit: Fruit, _ stock: Int) {
        switch fruit {
        case .strawberry:
            strawberry = stock
        case .banana:
            banana = stock
        case .pineapple:
            pineapple = stock
        case .kiwi:
            kiwi = stock
        case .mango:
            mango = stock
        }
    }
}
