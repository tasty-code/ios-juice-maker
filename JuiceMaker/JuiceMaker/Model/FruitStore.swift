//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

final class FruitStore {
    let shared = FruitStore()
    private var fruitList: [Fruit: Int] = Dictionary(uniqueKeysWithValues: zip(Fruit.allCases, Array(repeating: 10, count: 5)))

    private init() {}
    
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
