//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum FruitJuice: String {
    case strawberry = "strawberry"
    case banana = "banana"
    case pineapple = "pineapple"
    case kiwi = "kiwi"
    case mango = "mango"
    case strawberryBanana = "strawberryBanana"
    case mangoKiwi = "mangoKiwi"
}

enum Fruit: String {
    case strawberry = "strawberry"
    case banana = "banana"
    case pineapple = "pineapple"
    case kiwi = "kiwi"
    case mango = "mango"
}

// 과일 저장소 타입
class FruitStore {
    var strawberryStock: Int = 10
    var bananaStock: Int = 10
    var pineappleStock: Int = 10
    var kiwiStock: Int = 10
    var mangoStock: Int = 10
    
    func changeStock(strawberry: Int = 0, banana: Int = 0, pineapple: Int = 0, kiwi: Int = 0, mango: Int = 0) {
        self.strawberryStock += strawberry
        self.bananaStock += banana
        self.pineappleStock += pineapple
        self.kiwiStock += kiwi
        self.mangoStock += mango
    }
}
