//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct FruitStore {
    private var store: Dictionary<Fruit, Int>
    
    init() {
        self.store = Dictionary()
        Fruit.allCases.forEach { store[$0] = 10 }
    }
    
    public mutating func warehouse(fruit: Fruit, count: Int) {
        if let nowCount = store[fruit] {
            store[fruit] = nowCount + count
        }
    }
    
    public mutating func release(fruit: Fruit, count: Int) {
        guard let nowCount = store[fruit] else {
            return
        }
        
        if nowCount < count {
            return
        }
        
        store[fruit] = nowCount - count
    }
    
    
    func checkStock(fruit: Fruit, count: Int) -> Bool {
        if let nowCount = store[fruit], nowCount >= count {
            return true
        }
        return false
    }
}
