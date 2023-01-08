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
    
    func increaseStock(of fruit: String, by amount: Int = 1) {
        guard fruits.keys.contains(fruit) else { return }
        
        fruits[fruit]?.stock += amount
    }
    
    func decreaseStock(of fruit: String, by amount: Int = 1) {
        guard fruits.keys.contains(fruit) else { return }
        guard fruits[fruit]?.stock ?? 0 > 0 else { return }
        
        fruits[fruit]?.stock -= amount
    }
    
    func changeStock(of fruit: String, by amount: Int) {
        if amount.signum() == 1 {
            increaseStock(of: fruit, by: amount)
            return
        } else if amount.signum() == -1 {
            decreaseStock(of: fruit, by: amount)
            return
        } else {
            print("Error")
            return
        }
    }
    
    private init() {}
}
