//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

final class FruitStore {
    
    // MARK: Properties
    private var fruitContainer: [Fruit: Int]
    
    // MARK: Initializer
    init(fruitContainer: [Fruit: Int]) {
        self.fruitContainer = fruitContainer
    }
    
    // MARK: Custom Methods
    func checkFruitContainer() -> [Fruit: Int] {
        return fruitContainer
    }
    
    func quantity(of fruit: Fruit) -> Int {
        return fruitContainer[fruit, default: 0]
    }
    
    func updateFruitContainer(with data: [Fruit: Int]) {
        fruitContainer = data
    }
    
    func updateFruitQuantity(of fruit: Fruit, by quantity: Int) {
        fruitContainer[fruit] = quantity
    }
}
