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
    enum Fruit {
        static let strawberry = Storage()
        static let banana = Storage()
        static let kiwi = Storage()
        static let pineapple = Storage()
        static let mango = Storage()
    }
}



