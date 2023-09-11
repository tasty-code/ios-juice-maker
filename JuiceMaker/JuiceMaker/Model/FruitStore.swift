//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    var fruitList = [Fruit: Int]()
    
    init() {
        Fruit.allCases.forEach {
            self.fruitList.updateValue(10, forKey: $0)
        }
    }
    
    func add(_ ingredient: [Fruit: Int]) -> Void {
        for (fruit, amount) in ingredient {
            self.fruitList.updateValue(fruitList[fruit]! + amount, forKey: fruit)
        }
    }

    
    func deduct(_ ingredient: [Fruit: Int]) -> Void {
        for (fruit, amount) in ingredient {
            self.fruitList.updateValue(fruitList[fruit]! - amount, forKey: fruit)
        }
    }
    
    func getRemain(_ ingredient: [Fruit]) -> [Fruit: Int] {
        var remains = [Fruit: Int]()
        for fruit in ingredient {
            remains.updateValue(fruitList[fruit]!, forKey: fruit)
        }
        return remains
    }
}

