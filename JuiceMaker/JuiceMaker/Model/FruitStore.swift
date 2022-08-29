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
    
    var fruits: [Fruit: Int] = [.strawberry: 10, .banana: 10, .pineapple: 10, .kiwi: 10, .mango: 10]
    
    func getAmount(of name: Fruit) -> Int {
        for ingredient in fruits {
            if name == ingredient.key {
                return ingredient.value
            }
        }
        return 0
    }
    func increase(of name: Fruit, to amount: Int) {
        for ingredient in fruits {
            var outDict: Int = ingredient.value
            
            if name == ingredient.key {
                outDict += amount
            }
            fruits[name] = outDict
        }
    }
    func decrease(of name: Fruit, to amount: Int) {
        for ingredient in fruits {
            var outDict: Int = ingredient.value
            
            if name == ingredient.key {
                outDict -= amount
            }
            fruits[name] = outDict
        }
    }
}
