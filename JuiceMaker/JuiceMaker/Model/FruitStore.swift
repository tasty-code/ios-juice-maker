//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    static let shared = FruitStore()
    
    enum Fruit: String {
        case strawberry
        case pineapple
        case banana
        case kiwi
        case mango
    }
    
    var inventory = ["strawberry": 10, "pineapple": 10, "banana": 10, "kiwi": 10, "mango": 10]
    
    func add(fruitName: Fruit, num: Int) {
        guard let currentNum = inventory[fruitName.rawValue] else { return }
        let number = currentNum + num
        inventory.updateValue(number, forKey: fruitName.rawValue)
    }
    
    func minus(fruitName: Fruit, num: Int) {
        guard let currentNum = inventory[fruitName.rawValue] else { return }
        let number = currentNum - num
        inventory.updateValue(number, forKey: fruitName.rawValue)
    }
    
    func getNum(fruitName: Fruit) -> Int? {
        guard let currentNum = inventory[fruitName.rawValue] else { return nil }
        return currentNum
    }
}
