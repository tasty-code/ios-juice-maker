//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation
import UIKit

// 과일 저장소 타입
class FruitStore {
    enum Fruit: Int, CaseIterable {
        case strawberry, banana, pineapple, kiwi, mango 
    }
    
    var fruits = [Fruit: Int]()
    
    init(remainingStock: Int) {
        for fruit in Fruit.allCases {
            fruits[fruit] = remainingStock
        }
    }
    
    func increase(fruit: Fruit, stockChange: Int) {
        for remainingStock in fruits {
            var fruitsValue = remainingStock.value
            if fruit == remainingStock.key {
                fruitsValue += stockChange
                fruits[fruit] = fruitsValue
            }
        }
    }
    
    func decrease(fruit: Fruit, stockChange: Int) {
        for remainingStock in fruits {
            var fruitsValue = remainingStock.value
            if fruit == remainingStock.key {
                fruitsValue -= stockChange
                fruits[fruit] = fruitsValue
            }
        }
    }
}
let fruitStore = FruitStore(remainingStock: 10)


