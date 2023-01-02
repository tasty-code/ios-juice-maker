//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    var fruits: [Fruit: Int] = [:]
    
    init(개수: Int) {
        for fruit in Fruit.allCases {
            fruits[fruit] = 개수
        }
    }
    
    func add(과일: Fruit, 개수: Int) throws {
        guard let 재고 = fruits[과일] else {
            // 에러 처리 필요
            return
        }
        fruits.updateValue(재고 + 개수, forKey: 과일)
    }
    
    func subtract() {
        return
    }
    
    func check() {
        return
    }
    
}
