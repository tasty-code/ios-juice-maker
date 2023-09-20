//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    private (set) var fruitBox: [Fruit: Int] = [.strawberry: 10, .banana: 10, .pineapple: 10, .kiwi: 10, .mango: 10]
    
    func showCurrentList() -> [Fruit: Int] {
        return fruitBox
    }
    
    func getStockInfo(_ fruit: Fruit) throws -> Int {
        guard let firstFruit = self.fruitBox[fruit] else {
            throw ErrorMessage.invalidInput
        }
        return firstFruit
    }
}


extension FruitStore {
    public func calculateStock(_ consumeRecipe: [Fruit: Int]) -> Bool {
        for (fruit, needs) in consumeRecipe {
            guard let current = fruitBox[fruit] else  {
                return false
            }
            fruitBox[fruit] = current - needs
        }
        return true
    }
}
