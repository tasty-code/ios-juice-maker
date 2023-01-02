//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    private(set) var stock: [Fruit: Int] = [:]
    
    init() {
        Fruit.allCases.forEach { fruit in
            stock[fruit] = 10
        }
    }
    
    func changeStock(of fruit: Fruit, by number: Int) {
        guard let result = stock[fruit] else {
            return
        }
        
        stock[fruit] = result + number
    }
}
