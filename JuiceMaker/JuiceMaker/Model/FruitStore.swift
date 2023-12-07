//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    var fruitList: [FruitData] = [
        FruitData(name: .strawberry, quantity: 0),
        FruitData(name: .banana, quantity: 0),
        FruitData(name: .pineapple, quantity: 0),
        FruitData(name: .kiwi, quantity: 0),
        FruitData(name: .mango, quantity: 0)
    ]
    
    func addQuantity(fruit: FruitType) {
        if let index = fruitList.firstIndex(where: { $0.name == fruit }) {
            fruitList[index].quantity += 1
        }
    }
    
    func deleteQuantity(fruit: FruitType) {
        if let index = fruitList.firstIndex(where: { $0.name == fruit }) {
            fruitList[index].quantity -= 1
        }
    }
    
    func showQuantity(fruit: FruitType) -> String {
        if let index = fruitList.firstIndex(where: { $0.name == fruit }) {
            return String(fruitList[index].quantity)
        }
        return String(0)
    }
}

