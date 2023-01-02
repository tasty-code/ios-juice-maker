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
}
