//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
final class FruitStore {
    static let shared = FruitStore()
    
    private(set) var stock: [Fruit: Int] = [:]
    
    private init() {
        Fruit.allCases.forEach { fruit in
            stock[fruit] = 10
        }
    }
    
    func changeStock(of fruit: Fruit, by number: Int) throws {
        guard let fruitStock = stock[fruit] else {
            throw StockError.noCorrespondingFruit
        }
        guard fruitStock + number >= 0 else {
            throw StockError.notEnoughToChange
        }
        
        stock[fruit] = fruitStock + number
    }
}
