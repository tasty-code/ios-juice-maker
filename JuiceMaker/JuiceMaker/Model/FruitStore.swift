//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    
    static var shared = FruitStore(initiallStock: 10)
    
    enum Fruits: CaseIterable {
        case strawberries
        case bananas
        case kiwis
        case pineapples
        case mangos
    }
    
    var stocks = [Fruits: Int]()
    
    func countStock(of fruit: Fruits) -> Int {
        guard let stock = stocks[fruit] else { return 0 }
        return stock
    }
    
    func decrease(of fruit: Fruits, amount: Int) {
        guard let stock = stocks[fruit] else { return }
        stocks.updateValue(stock - amount, forKey: fruit)
    }
    
    private init(initiallStock: Int) {
        Fruits.allCases.forEach { stocks[$0] = initiallStock }
    }
}
