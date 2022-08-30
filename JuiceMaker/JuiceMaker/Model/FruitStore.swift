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
        for fruit in fruits {
            if name == fruit.key {
                return fruit.value
            }
        }
        
        return 0
    }
    
    func increase(of name: Fruit, to amount: Int) {
        for fruit in fruits {
            var outDict: Int = fruit.value
            
            if name == fruit.key {
                outDict += amount
            }
            
            fruits[name] = outDict
        }
    }
    
    func decrease(of name: Fruit, to amount: Int) {
        for fruit in fruits {
            var fruitsValue: Int = fruit.value
            
            if name == fruit.key {
                fruitsValue -= amount
            }
            fruits[name] = fruitsValue
        }
    }
}
