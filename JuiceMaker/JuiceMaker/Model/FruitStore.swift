//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    var strawberry: FruitStock
    var banana: FruitStock
    var pineapple: FruitStock
    var kiwi: FruitStock
    var mango: FruitStock
    
    init(strawberry: FruitStock, banana: FruitStock, pineapple: FruitStock, kiwi: FruitStock, mango: FruitStock) {
        self.strawberry = strawberry
        self.banana = banana
        self.pineapple = pineapple
        self.kiwi = kiwi
        self.mango = mango
    }
}
