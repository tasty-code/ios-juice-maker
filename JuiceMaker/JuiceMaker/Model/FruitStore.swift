//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

final class FruitStore: Storing {
    private(set) var items: [Fruit : Int] = [:]
    
    init(defaultStock count: Int) {
        for fruit in Fruit.allCases {
            add(item: fruit, count: count)
        }
    }
    
    func add(item: Fruit, count: Int) {
        items[item, default: 0] += count
    }
    
    private func subtract(item: Fruit, count: Int) {
        items[item]? -= count
    }
    
    func subtract(pairOfItems: [Fruit: Int]) {
        for (fruit, usedAmount) in pairOfItems {
            subtract(item: fruit, count: usedAmount)
        }
    }
    
    private func hasEnough(item: Fruit, count: Int) -> Bool {
        return items[item, default: 0] >= count
    }
    
    func hasEnough(pairOfItems: [Fruit: Int]) -> Bool {
        return pairOfItems.allSatisfy { (item: Fruit, count: Int) in
           hasEnough(item: item, count: count)
        }
    }
}
