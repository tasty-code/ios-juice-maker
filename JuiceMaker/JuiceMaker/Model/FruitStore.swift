//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    private var store: Dictionary<Fruit, Int>
    
    init() {
        self.store = Dictionary()
        Fruit.allCases.forEach { store[$0] = 10 }
    }
    
    
    
}
