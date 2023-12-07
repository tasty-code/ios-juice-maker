//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    let shared: FruitStore = FruitStore()
    
    var fruitList: [FruitData] = [
        FruitData(name: .strawberry, quantity: 0),
        FruitData(name: .banana, quantity: 0),
        FruitData(name: .pineapple, quantity: 0),
        FruitData(name: .kiwi, quantity: 0),
        FruitData(name: .mango, quantity: 0)
    ]
    
    func addFruitQuantity(fruit: FruitType) {
        if let index = fruitList.firstIndex(where: { $0.name == fruit }) {
            fruitList[index].quantity += 1
        }
    }
    
    func deleteFruitQuantity(fruit: FruitType) {
        if let index = fruitList.firstIndex(where: { $0.name == fruit }) {
            fruitList[index].quantity -= 1
        }
    }
    
    func showFruitQuantity(fruit: FruitType) -> String {
        if let index = fruitList.firstIndex(where: { $0.name == fruit }) {
            return String(fruitList[index].quantity)
        }
        return String(0)
    }
    
    func checkFruitsQuantity(fruit: FruitType, usedQuantity: Int64) -> Bool {
        let result = fruitList
            .firstIndex { $0.name == fruit }
            .map { fruitList[$0].quantity >= usedQuantity } ?? false
        return result
    }
    

}

