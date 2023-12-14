//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

// 과일 저장소 타입
final class FruitStore {
    static let shared: FruitStore = FruitStore()
    
    private init() {}
    
    var fruitList: [FruitInfo] = [
        FruitInfo(name: .strawberry, quantity: 0),
        FruitInfo(name: .banana, quantity: 0),
        FruitInfo(name: .pineapple, quantity: 0),
        FruitInfo(name: .kiwi, quantity: 0),
        FruitInfo(name: .mango, quantity: 0)
    ]
    
    public func updateFruitQuantity(fruit: Fruit, result: Int) {
        if let index = fruitList.firstIndex(where: { $0.name == fruit }) {
            fruitList[index].quantity = result
        }
    }
    
    public func showFruitQuantity(fruit: Fruit) -> String {
        if let index = fruitList.firstIndex(where: { $0.name == fruit }) {
            return String(fruitList[index].quantity)
        }
        return String(0)
    }
    
    public func checkFruitsQuantity(fruit: Fruit, willUseQuantity: Int) -> Bool {
        let result = fruitList
            .firstIndex { $0.name == fruit }
            .map { fruitList[$0].quantity >= willUseQuantity } ?? false
        return result
    }
    
    public func usedFruitsQuantity(fruit: Fruit, usedQuantity: Int) {
        if let index = fruitList.firstIndex(where: { $0.name == fruit }) {
            fruitList[index].quantity -= usedQuantity
        }
    }
    
    func checkFruit(fruit: Fruit) -> Int {
        return fruitList.map { $0.name == fruit }.count
    }
    

}

