//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    
    static let shared = FruitStore()
    
    var strawberry: Int = 10
    var banana: Int = 10
    var kiwi: Int = 10
    var pineapple: Int = 10
    var mango: Int = 10
    
    private init() {}
}
