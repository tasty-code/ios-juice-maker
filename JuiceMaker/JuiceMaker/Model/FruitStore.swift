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
    
    public func warehouse(fruit: Fruit, quantity: Int) {
        guard let nowCount = store[fruit] else {
            return
        }
        store[fruit] = nowCount + quantity
    }
    
    public func release(fruit: Fruit, stock: Int) {
        guard let nowCount = store[fruit] else {
            return
        }
        
        if nowCount < stock {
            return
        }
        
        store[fruit] = nowCount - stock
    }
    
    
    func checkStock(fruit: Fruit, stock: Int) -> Bool {
        guard let nowCount = store[fruit] else {
            return false
        }
        
        if nowCount < stock {
            return false
        }
        
        return true
    }
}
