//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
final class FruitStore {
    static let shared = FruitStore(initialStock: 10)
    
    private(set) var stocks = [Fruits: Int]()
    
    func count(of fruit: Fruits) -> Int {
        guard let stock = stocks[fruit] else { return 0 }
        return stock
    }
    
    func decrease(of fruit: Fruits, amount: Int) {
        guard let stock = stocks[fruit] else { return }
        stocks.updateValue(stock - amount, forKey: fruit)
    }
    
    func increase(of fruit: Fruits, amount: Int) {
        guard let stock = stocks[fruit] else { return }
        stocks.updateValue(stock + amount, forKey: fruit)
    }
    
    private init(initialStock: Int) {
        Fruits.allCases.forEach { stocks[$0] = initialStock }
    }
}
