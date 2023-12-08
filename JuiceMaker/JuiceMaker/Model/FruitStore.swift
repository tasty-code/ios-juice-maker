//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
final class FruitStore {
    private var quantityOfAllFruits: [FruitName: Int] = [.strawberry: 50, .banana: 50, .pineapple: 50, .kiwi: 50, .mango: 50]
    
    func consumeFruit(fruitName: FruitName, fruitQuantity quantity: Int) throws {
        guard let oldQuantity = currentFruitStockQuantity(fruitName: fruitName) else {
            throw JuiceError.quantityOfAllFruitsAccessFailed
        }
        
        do {
            try checkStockQuantity(oldQuantity: oldQuantity, quantity: quantity)
        } catch JuiceError.outOfStock {
            print(JuiceError.outOfStock.localizedDescription)
        }
        
        let newQuantity = oldQuantity - quantity
        setFruitStockQuantity(fruitName: fruitName, quantityToChange: newQuantity)
    }
    
    private func checkStockQuantity(oldQuantity: Int, quantity: Int) throws {
        guard oldQuantity >= quantity else {
            throw JuiceError.outOfStock
        }
    }
    
    func currentFruitStockQuantity(fruitName: FruitName) -> Int? {
        return quantityOfAllFruits[fruitName]
    }
    
    func setFruitStockQuantity(fruitName: FruitName, quantityToChange: Int) {
        quantityOfAllFruits[fruitName] = quantityToChange
    }

    func currentQuantityOfAllFruits() -> [FruitName: Int] {
        return quantityOfAllFruits
    }
}
