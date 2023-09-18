//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    private var fruitBox: [Fruit: Int] = [.strawberry : 10, .banana : 10, .pineapple : 10, .kiwi : 10, .mango : 10]

    func errorHandler(_ consumeRecipe: [Fruit : Int?]) throws -> Bool {
        if consumeRecipe.values.filter({ $0 == nil }).count == 2 {
            throw ErrorMessage.stockInsufficients(Array(consumeRecipe.keys))
        }
        if consumeRecipe.values.contains(nil) {
            let nilValues = consumeRecipe.filter { $0.value == nil }.map { $0.key }
            throw ErrorMessage.stockInsufficient(nilValues[0])
        }
        let nonOptionalRecipe = consumeRecipe.compactMapValues({ $0 })
        return calculateStock(nonOptionalRecipe) ? true : false
    }
    
    func getStockInfo(_ fruit: Fruit) throws -> Int {
        guard let firstFruit = self.fruitBox[fruit] else {
            throw ErrorMessage.invalidInput
        }
        return firstFruit
    }
    
    private func calculateStock(_ consumeRecipe: [Fruit : Int]) -> Bool {
        for (fruit, needs) in consumeRecipe {
            guard let current = fruitBox[fruit] else  {
                return false
            }
            fruitBox[fruit] = current - needs
        }
        return true
    }
}
