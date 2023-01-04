//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    static let shared = FruitStore()
    
    var fruits: [String:Fruit] = Fruits.makeFruitArray()
    
    func increaseStock(of fruit: String) {
        guard fruits.keys.contains(fruit) else { return }
        
        fruits[fruit]?.amount += 1
    }
    
    func decreaseStock(of fruit: String) {
        guard fruits.keys.contains(fruit) else { return }
        guard fruits[fruit]?.amount ?? 0 > 0 else { return }
        
        fruits[fruit]?.amount -= 1
    }
    
    private init() {}
}
