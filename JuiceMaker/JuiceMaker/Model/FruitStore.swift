//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class Storage {
    private(set) var amount: Int = 10
    
    func minusAmount(_ amount: Int) {
        self.amount -= amount
    }
    
    func addAmount(_ amount: Int) {
        self.amount = amount
    }
}

enum Fruit {
    static let strawberry = Storage()
    static let banana = Storage()
    static let kiwi = Storage()
    static let pineapple = Storage()
    static let mango = Storage()
}
