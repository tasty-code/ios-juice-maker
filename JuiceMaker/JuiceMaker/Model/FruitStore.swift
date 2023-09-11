//
//  JuiceMaker - FruitStore.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    private var strawberry: UInt
    private var banana: UInt
    private var pineapple: UInt
    private var mango: UInt
    private var kiwi: UInt
    
    init(strawberry: UInt, banana: UInt, pineapple: UInt, mango: UInt, kiwi: UInt) {
        self.strawberry = strawberry
        self.banana = banana
        self.pineapple = pineapple
        self.mango = mango
        self.kiwi = kiwi
    }
    
    convenience init(count: UInt) {
        self.init(strawberry: count, banana: count, pineapple: count, mango: count, kiwi: count)
    }
    
    convenience init() {
        self.init(count: 10)
    }
    
    func update(fruits: Fruit..., as option: ((UInt, UInt) -> UInt)) {
        for fruit in fruits {
            update(fruit, as: option)
        }
    }
    
    func update(_ fruit: Fruit, as option: ((UInt, UInt) -> UInt)) {
        switch fruit.fruitType {
        case .strawberry:
            strawberry = option(strawberry, fruit.count)
        case .banana:
            banana = option(banana, fruit.count)
        case .pineapple:
            pineapple = option(pineapple, fruit.count)
        case .mango:
            mango = option(mango, fruit.count)
        case .kiwi:
            kiwi = option(kiwi, fruit.count)
        }
    }
}
