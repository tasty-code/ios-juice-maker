//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
final class FruitStore {
    static let shared = FruitStore(initialStock: 10)
    weak var orderDelegate: OrderDelegate?
    weak var storeDelegate: StoreDelegate?
    
    private var stocks = [Fruits: Int]() {
        didSet {
            storeDelegate?.syncFruitStocks()
            orderDelegate?.syncFruitStocks()
        }
    }
    
    func count(of fruit: Fruits) -> Int {
        guard let stock = stocks[fruit] else { return 0 }
        return stock
    }
    
    func changeStock(of fruit: Fruits, count: Int) {
        stocks.updateValue(count, forKey: fruit)
    }
    
    func consume(_ fruit: Fruits, amount: Int) {
        guard let stock = stocks[fruit] else { return }
        stocks.updateValue(stock - amount, forKey: fruit)
    }
    
    private init(initialStock: Int) {
        Fruits.allCases.forEach { stocks[$0] = initialStock }
    }
}
