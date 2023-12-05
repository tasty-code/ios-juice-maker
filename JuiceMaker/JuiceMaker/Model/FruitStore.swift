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
    
    public func warehouse(fruit: Fruit, count: Int) {
        guard let nowCount = store[fruit] else {
            return
        }
        store[fruit] = nowCount + count
    }
    
    public func release(fruit: Fruit, count: Int) -> Bool {
        guard let nowCount = store[fruit] else {
            return false
        }
        
        if nowCount < count {
            return false
        }
        
        store[fruit] = nowCount - count
        return true
    }
    
}
