//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class Storage {
    private(set) var amount: Int = 10
    
    func decreaseAmount(_ amount: Int) {
        self.amount -= amount
    }
    
    func increaseAmount(_ amount: Int) {
        self.amount += amount
    }
}

class FruitStore {
    static let shared = FruitStore()
    
    let strawberry = Storage()
    let banana = Storage()
    let kiwi = Storage()
    let pineapple = Storage()
    let mango = Storage()
    
    private init() { }
}



