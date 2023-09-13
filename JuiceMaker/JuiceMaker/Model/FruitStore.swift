//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

final class FruitStore {
    private var fruitList = [Fruit: Int]()
    
    init() {
        Fruit.allCases.forEach {
            self.fruitList.updateValue(10, forKey: $0)
        }
    }
    
    func getRemains(_ ingredient: Array<Fruit>) -> [Fruit: Int] {
        var remains = [Fruit: Int]()
        for fruit in ingredient {
            remains[fruit] = fruitList[fruit]
        }
        return remains
    }
    
    func add(_ inStockList: [Fruit: Int]) -> Void {
        fruitList.merge(inStockList) { stock, new in
            return stock + new }
    }
    
    func deduct(_ usedList: [Fruit: Int]) -> Void {
        fruitList.merge(usedList) { stock, used in
            return stock - used }
    }
}
