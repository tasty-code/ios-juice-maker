//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation


final class FruitStore {
    
    // MARK: - Properties
    
    private var fruitStock: [Fruit: Int] = [
        .strawberry: 10,
        .banana: 10,
        .pineapple: 10,
        .kiwi: 10,
        .mango: 10] {
            didSet {
                NotificationCenter.default.post(
                    name: Notification.Name("stockDidChanged"),
                    object: self
                )
            }
        }
    
    // MARK: - Methods
    
    func consume(fruit: Fruit, count: Int) {
        guard let remainCount = fruitStock[fruit] else { return }
        fruitStock.updateValue(remainCount - count, forKey: fruit)
    }
    
    func quantity(of fruit: Fruit) -> Int {
        guard let quantity = fruitStock[fruit] else { return 0 }
        return quantity
    }
    
    func getFruitStock() -> [Fruit : Int] {
        return self.fruitStock
    }
}
