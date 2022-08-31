//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation
import UIKit


class FruitStore {
    enum Fruit: CaseIterable {
        case strawberry
        case banana
        case pineapple
        case kiwi
        case mango
    }
    
    private var fruits: [Fruit: Int] = [:]
    
    init() {
        let defaultAmount = 10
        
        for fruit in Fruit.allCases {
            fruits[fruit] = defaultAmount
        }
    }
    
    func getAmount(of name: Fruit) -> Int {
        return getAmount(of: name)
    }
    
    func increase(of name: Fruit, to amount: Int) {
        let fruitValue = getAmount(of: name) + amount
        fruits[name] = fruitValue
    }
    
    func decrease(of name: Fruit, to amount: Int) {
        let fruitValue = getAmount(of: name) - amount
        fruits[name] = fruitValue
    }
}
