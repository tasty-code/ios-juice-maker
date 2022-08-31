//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    enum FruitJuice: String {
        case strawberry = "S"
        case banana = "B"
        case pineapple = "P"
        case kiwi = "K"
        case mango = "M"
        case strawberryBanana = "SB"
        case mangoKiwi = "MK"
    }

    enum Fruit: CaseIterable {
        case strawberry, banana, pineapple, kiwi, mango
    }
    
    var strawberry: Int = 10
    var banana: Int = 10
    var pineapple: Int = 10
    var kiwi: Int = 10
    var mango: Int = 10
    
    func addStock(strawberry: Int = 0, banana: Int = 0, pineapple: Int = 0, kiwi: Int = 0, mango: Int = 0) {
        self.strawberry += strawberry
        self.banana += banana
        self.pineapple += pineapple
        self.kiwi += kiwi
        self.mango += mango
    }
    
    func decreaseStock(strawberry: Int = 0, banana: Int = 0, pineapple: Int = 0, kiwi: Int = 0, mango: Int = 0) {
        self.strawberry -= strawberry
        self.banana -= banana
        self.pineapple -= pineapple
        self.kiwi -= kiwi
        self.mango -= mango
    }
}
