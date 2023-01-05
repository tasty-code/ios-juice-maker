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
    
    func subtractStock(fruitType: Fruit, quantity: UInt) throws {
        guard let fruitStock: UInt = self.stockByFruit[fruitType] else {
            throw JuiceMakerError.notExistFruit
        }
        guard fruitStock >= quantity else {
            throw JuiceMakerError.outOfStock
        }
        self.stockByFruit[fruitType] = fruitStock - quantity
    }
    
    func addStock(fruitType: Fruit, quantity: UInt) throws {
        guard let fruitStock: UInt = self.stockByFruit[fruitType] else {
            throw JuiceMakerError.notExistFruit
        }
        self.stockByFruit[fruitType] = fruitStock + quantity
    }
}
