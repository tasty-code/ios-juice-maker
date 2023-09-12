//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
final class FruitStore {
    
    // MARK: - Properties
    
    static let shared = FruitStore()
    
    var fruitNames = ["딸기", "바나나", "파인애플", "키위", "망고"]
    var fruitDictionary: [String: Int] = [:]
    
    // MARK: - Init
    
    private init() {
        for name in fruitNames {
            fruitDictionary[name] = 10
        }
    }
    
    func useFruit() {
        fruitDictionary["딸기", default: 10] -= 2
    }
}
