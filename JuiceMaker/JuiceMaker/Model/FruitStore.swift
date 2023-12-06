//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
final class FruitStore {
    private var quantityOfAllFruits: [FruitName: Int] = [.strawberry: 10, .banana: 10, .pineapple: 10, .kiwi: 10, .mango: 10]
    
    func consumeFruit(fruitName: FruitName, fruitQuantity quantity: Int) {
        guard let oldQuantity = quantityOfAllFruits[fruitName] else {
            return
        }
        
        guard oldQuantity >= quantity else {
            print("과일 재고 부족")
            return
        }
        
        let newQuantity = oldQuantity - quantity
        quantityOfAllFruits[fruitName] = newQuantity
    }
}
