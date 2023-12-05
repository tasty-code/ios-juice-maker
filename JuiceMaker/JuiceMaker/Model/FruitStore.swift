//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    var stock = [String: Int]()
    init() {
        stock = [
            "strawberry": 10,
            "banana": 10,
            "pineapple": 10,
            "kiwi": 10,
            "mango": 10
        ]
    }
    
    func changeStock(fruitName: [String: Int]) {
        for(name, num) in fruitName {
            guard var currentStock = stock[name] else { return }
            currentStock -= num
            stock[name] = currentStock
        }
    }
}
