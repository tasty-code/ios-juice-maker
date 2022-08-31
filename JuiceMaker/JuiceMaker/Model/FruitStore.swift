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
    private var observeFun: ([Fruit: Int]) -> Void = { _ in  }
    var fruits: [Fruit: Int] = Dictionary(Fruit.allCases.map { ($0, 10) }, uniquingKeysWith: { (first, _) in first }) {
        didSet(oldTotalSteps) {
            observeFun(fruits)
        }
    }
    
    init() {}
    
    func fruitsObserve(at: @escaping ([Fruit: Int]) -> Void) -> () -> Void {
        observeFun = at
        return { () -> Void in self.observeFun = {_ in  } }
    }
    
    func getQuantity(of fruit: Fruit) throws -> Int {
        guard let result = fruits[fruit] else { throw ValueError.noValue }
        return result
    }
    
    func setQuantity(of fruit: Fruit, at quantity: Int) {
        fruits[fruit] = quantity
    }
}
