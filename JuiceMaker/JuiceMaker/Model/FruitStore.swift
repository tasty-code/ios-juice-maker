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
        resetStockValue()
    }
    
    func resetStockValue() {
        Fruit.allCases.forEach { fruit in
            stock[fruit] = Constants.Number.initialFruitStockQuantity
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
    
    func setStock(of fruit: Fruit, to number: Int) throws {
        guard number >= 0 else { throw StockError.notEnoughToChange }
        stock[fruit] = Int(number)
    }
}
