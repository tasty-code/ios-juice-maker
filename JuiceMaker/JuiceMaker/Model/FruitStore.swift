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
    func fetchFruitContainer() -> [Fruit: Int] {
        return fruitContainer
    }
    
    func fetchFruitQuantity(of fruit: Fruit) -> Int {
        return fruitContainer[fruit, default: 0] 
    }
    
    func updateFruitContainer(_ data: [Fruit: Int]) {
        fruitContainer = data
    }
    
    func updateFruitQuantity(of fruit: Fruit, by quantity: Int) {
        fruitContainer[fruit] = quantity
    }
}
