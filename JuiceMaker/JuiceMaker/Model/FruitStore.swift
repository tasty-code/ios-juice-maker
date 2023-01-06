//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
final class FruitStore {
    static let defaultStock: UInt = 10
    private(set) var stockByFruit = [Fruit: UInt]()
    
    enum Fruit: CaseIterable {
        case strawberry, banana, pineapple, kiwi, mango
    }
    
    init(stock: UInt = defaultStock) {
        for fruit in Fruit.allCases {
            stockByFruit[fruit] = stock
        }
    }
    
    func subtractStock(fruit: Fruit, count: UInt) throws {
        guard let fruitStock = stockByFruit[fruit] else {
            throw JuiceMakerError.notExistFruit
        }
        guard fruitStock >= count else {
            throw JuiceMakerError.outOfStock
        }
        stockByFruit[fruit] = fruitStock - count
    }
    
    func addStock(fruit: Fruit, count: UInt) throws {
        guard let fruitStock = stockByFruit[fruit] else {
            throw JuiceMakerError.notExistFruit
        }
        stockByFruit[fruit] = fruitStock + count
    }
}
