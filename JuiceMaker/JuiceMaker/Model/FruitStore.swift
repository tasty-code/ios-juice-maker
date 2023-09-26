//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class FruitStore {
    private var fruitBox: [Fruit: Int] = [.strawberry: 10, .banana: 10, .pineapple: 10, .kiwi: 10, .mango: 10]
    
    func getStockInfo(_ fruit: Fruit) throws -> Int {
        guard let stockCount = self.fruitBox[fruit] else {
            throw ErrorMessage.invalidInput
        }
        return stockCount
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
    
    public func stockManager(_ fruit: Fruit, changedStock: Double) {
       fruitBox[fruit] = Int(changedStock)
    }
}
//일일이 업데이트한 값을 stockVC 가지고 있다가 -> AVC로 저 값을 넘기고 -> AVC에서 넘어온 값을 바탕으로 모델을 업데이트해라.

