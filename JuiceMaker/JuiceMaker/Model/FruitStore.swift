//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    static let shared = FruitStore()
    
    var strawberry = 10
    var banana = 10
    var kiwi = 10
    var pineapple = 10
    var mango = 10
    
    private init() {}
}
