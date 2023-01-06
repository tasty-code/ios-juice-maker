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
    
    enum Fruit: Int, CaseIterable {
        case strawberry, banana, pineapple, kiwi, mango
    }
    
    init(stock: UInt = defaultStock) {
        for fruit in Fruit.allCases {
            stockByFruit[fruit] = stock
        }
    }
    
    func subtractStock(fruitType: Fruit, quantity: UInt) throws {
        let fruitStock = try isExist(fruit: fruitType)
        guard fruitStock >= quantity else {
            throw JuiceMakerError.outOfStock
        }
        self.stockByFruit[fruitType] = fruitStock - quantity
    }
    
    func addStock(fruitType: Fruit, quantity: UInt) throws {
        let fruitStock = try isExist(fruit: fruitType)
        self.stockByFruit[fruitType] = fruitStock + quantity
    }

    func isExist(fruit: Fruit) throws -> UInt {
        guard let fruitStock = stockByFruit[fruit] else {
            throw JuiceMakerError.notExistFruit
        }
        return fruitStock
    }
}
