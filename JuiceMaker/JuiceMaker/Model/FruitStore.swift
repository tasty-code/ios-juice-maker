//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum Fruit: CaseIterable {
    case strawberry, banana, pineapple, kiwi, mango
}

class FruitStore {
    var fruits: [Fruit: Int] = Dictionary(Fruit.allCases.map { ($0, 10) }, uniquingKeysWith: { (first, _) in first })
    
    init() {}
    
    func getQuantity(of fruit: Fruit) throws -> Int {
        guard let result = fruits[fruit] else { throw ValueError.noValue }
        return result
    }
    
    func setQuantity(of fruit: Fruit, at quantity: Int) {
        fruits[fruit] = quantity
    }
}
