//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    var fruitsInfo: [[Fruits: Int]] = [[.strawberry: 10], [.banana: 10], [.pineapple: 10], [.kiwi: 10], [.mango: 10]]
    
    func addQuantity(fruits: Fruits) {
        for i in 0..<fruitsInfo.count {
            var dict = fruitsInfo[i]
            if let value = dict[fruits] {
                dict[fruits] = value + 1
                fruitsInfo[i] = dict
            }
        }
    }
    
    func deleteQuantity(fruits: Fruits) {
        for i in 0..<fruitsInfo.count {
            var dict = fruitsInfo[i]
            if let value = dict[fruits] {
                dict[fruits] = value - 1
                fruitsInfo[i] = dict
            }
        }
    }
}

