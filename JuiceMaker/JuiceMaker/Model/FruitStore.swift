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
            add(item: fruit, 개수: 개수)
        }
    }
    
    func add(item: Fruit, 개수: Int) {
        items[item, default: 0] += 개수
    }
    
    func subtract(item: Fruit, 개수: Int) throws {
        guard let 재고 = items[item] else {
            // 에러 처리 필요
            return
        }
        items.updateValue(재고 - 개수, forKey: item)
    }
    
    func subtract(pairOfItems: [Fruit: Int]) throws {
        for (fruit, 사용량) in pairOfItems {
            try subtract(item: fruit, 개수: 사용량)
        }
    }
    
    func hasEnough(item: Fruit, 개수: Int) -> Bool {
        return items[item, default: 0] >= 개수
    }
    
    func hasEnough(pairOfItems: [Fruit: Int]) -> Bool {
        return pairOfItems.allSatisfy { (item: Fruit, 개수: Int) in
           hasEnough(item: item, 개수: 개수)
        }
    }
}
