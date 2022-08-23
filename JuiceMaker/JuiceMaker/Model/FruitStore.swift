//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    var strawberry : Int
    var banana : Int
    var pineapple : Int
    var kiwi : Int
    var mango : Int
    var change: Int
    
    init(strawberry: Int = 10, banana: Int = 10, pineapple: Int = 10, kiwi: Int = 10, mango: Int = 10, change: Int = 0) {
        self.strawberry = strawberry
        self.banana = banana
        self.pineapple = pineapple
        self.kiwi = kiwi
        self.mango = mango
        self.change = change
    }
}
