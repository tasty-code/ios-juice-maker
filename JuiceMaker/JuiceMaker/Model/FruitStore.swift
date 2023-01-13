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
    
    init(pairOfItems: [Fruit: Int]) {
        for (fruit, count) in pairOfItems {
            add(item: fruit, count: count)
        }
    }
    
    func add(item: Fruit, count: Int) {
        items[item, default: 0] += count
    }
    
    private func subtract(item: Fruit, count: Int) -> Bool {
        guard let stock = items[item],
              stock >= count else {
            return false
        }
        items.updateValue(stock - count, forKey: item)
        return true
    }
    
    func subtract(pairOfItems neededAmount: [Fruit: Int]) -> Bool{
        guard self.hasEnough(pairOfItems: neededAmount) else {
            return false
        }
        neededAmount.forEach({ (fruit: Fruit, usedAmount: Int) in
            _ = subtract(item: fruit, count: usedAmount)
        })
        return true
    }
}
