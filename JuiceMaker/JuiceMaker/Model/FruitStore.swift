//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class FruitStore {
    private var store: Dictionary<Fruit, Int>
    
    init() {
        self.store = Dictionary()
        Fruit.allCases.forEach { store[$0] = 10 }
    }
    
    public func release(fruit: Fruit, count: Int) {
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
    
    func fruitCount(fruit: Fruit) -> Int {
        if let nowCount =  store[fruit] {
            return nowCount
        }
        return 0
    }
    
    func updateFruitStore(fruitStore: Dictionary<Fruit, Int>) {
        store = fruitStore
    }
}


