//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
    let fruitStore = FruitStore.shared
    
    func make(juiceName: FruitJuice) throws {
        guard isEnoughFruit(of: juiceName) else {
            throw InfoMessageError.noStock
        }
        
        bringFruit(for: juiceName)
    }
    
    private func isEnoughFruit(of juiceName: FruitJuice) -> Bool {
        for (fruit, neededNumber) in juiceName.recipe {
            guard let currentStock = fruitStore.fruitStock[fruit], currentStock >= neededNumber else { return false }
        }
        
        return true
    }
    
    private func bringFruit(for juiceName: FruitJuice) {
        for (fruit, neededNumber) in juiceName.recipe {
            fruitStore.consumeStock(for: fruit, number: neededNumber)
        }
    }
}
