//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

final class FruitStore: Storing {
    private(set) var items: [Fruit : Int] = [:]
    
    init(count: Int) {
        Fruit.allCases.forEach { add(item: $0, count: count) }
    }
    
    init(pairOfItems: [Fruit: Int]) {
        pairOfItems.forEach { (fruit, count) in
            add(item: fruit, count: count)
        }
    }
    
    func add(item: Fruit, count: Int) {
        items[item, default: .zero] += count
    }
    
    private func subtract(item: Fruit, count: Int) -> Bool {
        guard let stock = items[item],
              stock >= count else {
            return false
        }
        
        items.updateValue(stock - count, forKey: item)
        return true
    }
    
    func subtract(pairOfItems neededAmounts: [Fruit: Int]) -> Bool{
        if self.hasEnough(pairOfItems: neededAmounts) {
            return neededAmounts.allSatisfy({ (fruit, usedAmount) in
                subtract(item: fruit, count: usedAmount)
            })
        }
        return false
    }
    
    func setStocks(pairOfItems stocks: [Fruit: Int]) {
        items.merge(stocks) { (_, new) in new }
    }
}
