//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    var strawberry: Int = 10
    var banana: Int = 10
    var pineapple: Int = 10
    var kiwi: Int = 10
    var mango: Int = 10
    
    func changeStock(strawberry: Int = 0, banana: Int = 0, pineapple: Int = 0, kiwi: Int = 0, mango: Int = 0) {
        self.strawberry += strawberry
        self.banana += banana
        self.pineapple += pineapple
        self.kiwi += kiwi
        self.mango += mango
    }
}
