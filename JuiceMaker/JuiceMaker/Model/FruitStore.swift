//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class FruitStore {
    static let shared = FruitStore()
    var store = [FruitList:Int]()
    
    private init() {
        for fruit in FruitList.allCases {
            store[fruit] = 10
        }
    }
    
}
