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
    var strawberry: Int
    var banana: Int
    var pineapple: Int
    var kiwi: Int
    var mango: Int
    
    init(_ strawberry: Int = 10, _ banana: Int = 10, _ pineapple: Int = 10, _ kiwi: Int = 10, _ mango: Int = 10) {
        self.strawberry = strawberry
        self.banana = banana
        self.pineapple = pineapple
        self.kiwi = kiwi
        self.mango = mango
    }
    
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


