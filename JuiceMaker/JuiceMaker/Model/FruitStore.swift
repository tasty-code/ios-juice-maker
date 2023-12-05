//
//  JuiceMaker - FruitStore.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    struct Item {
        var count: Int = 10
    }
    
    enum Fruit {
        case strawberry, banana, pineapple, kiwi, mango
    }
    
    var storage: [Fruit:Item] = [
        .strawberry: Item(),
        .banana: Item(),
        .pineapple: Item(),
        .kiwi: Item(),
        .mango: Item(),
    ]
    
    func supply(fruitName: Fruit, count: Int) {
        self.storage[fruitName]?.count += count
    }
}
