//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    static let defaultStock: UInt = 10
    private(set) var stockByFruit = [Fruit: UInt]()

    enum Fruit: CaseIterable {
        case strawberry, banana, pineapple, kiwi, mango
    }

    init(stock: UInt = defaultStock) {
        for fruit in Fruit.allCases {
            stockByFruit[fruit] = stock
        }
    }
}
