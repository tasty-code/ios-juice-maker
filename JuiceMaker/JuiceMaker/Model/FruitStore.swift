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
            return print("해당하는 과일이 존재하지 않습니다.")
        }
        guard result + number >= 0 else {
            return print("재고가 부족합니다.")
        }
        
        stock[fruit] = result + number
    }
}
