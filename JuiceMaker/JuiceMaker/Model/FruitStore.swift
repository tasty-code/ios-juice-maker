//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore: Storing {
    var items: [Fruit : Int] = [:]
    
    init(개수: Int) {
        for fruit in Fruit.allCases {
            items[fruit] = 개수
        }
    }
    
    func add(item: Fruit, 개수: Int) throws {
        guard let 재고 = items[item] else {
            // 에러 처리 필요
            return
        }
        items.updateValue(재고 + 개수, forKey: item)
    }
    
    func subtract(item: Fruit, 개수: Int) throws {
        guard let 재고 = items[item] else {
            // 에러 처리 필요
            return
        }
        items.updateValue(재고 - 개수, forKey: item)
    }
    
    func check() {
        return
    }
    
}
