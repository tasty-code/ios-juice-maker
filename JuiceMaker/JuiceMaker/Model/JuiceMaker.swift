//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    private let fruitStore: FruitStore = FruitStore()

    func makeJuice(juiceName: JuiceName) throws {
        try fruitStore.receiveOrder(juiceName: juiceName)
    }
    
    func checkFruitStoreInventory() -> [FruitName: Int] {
        return fruitStore.inventory
    }
    
    func updateFruitStoreInventory(with inventory: [FruitName: Int]) {
        fruitStore.updateInventoryStock(with: inventory)
    }
}
