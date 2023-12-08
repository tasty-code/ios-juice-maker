//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
final class FruitStore {
    private var quantityOfAllFruits: [FruitName: Int] = [.strawberry: 10, .banana: 10, .pineapple: 10, .kiwi: 10, .mango: 10]
    
    func consumeFruit(fruitName: FruitName, fruitQuantity quantity: Int) throws {
        guard let oldQuantity = quantityOfAllFruits[fruitName] else {
            throw JuiceError.quantityOfAllFruitsAccessFailed
        }
        
        do {
            try checkStockQuantity(oldQuantity: oldQuantity, quantity: quantity)
        } catch JuiceError.outOfStock {
            print(JuiceError.outOfStock.localizedDescription)
        }
        
        let newQuantity = oldQuantity - quantity
        quantityOfAllFruits[fruitName] = newQuantity
    }
    
    func checkStockQuantity(oldQuantity: Int, quantity: Int) throws {
        guard oldQuantity >= quantity else {
            throw JuiceError.outOfStock
        }
    }
}
