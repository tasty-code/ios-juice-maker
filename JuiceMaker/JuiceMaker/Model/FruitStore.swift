//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    
    var strawbrrie : Int
    var bannaa : Int
    var pineapple : Int
    var kiwi : Int
    var mango : Int
    
    init(strawbrrie: Int = 10, bannaa: Int = 10,pineapple: Int = 10, kiwi: Int = 10, mango: Int = 10) {
        self.strawbrrie = strawbrrie
        self.bannaa = bannaa
        self.pineapple = pineapple
        self.kiwi = kiwi
        self.mango = mango
    }
}
