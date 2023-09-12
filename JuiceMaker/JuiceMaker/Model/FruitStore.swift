//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    
    var fruits: [Fruit]
    
    init(fruits: [Fruit]) {
        self.fruits = fruits
    }
    
    struct Fruit: Equatable {
        var name: String
        var stock: Int = 10
    }
    
    func containsFruits(inputFruit: Fruit) throws -> Fruit {
        guard let fruit = fruits.filter({ $0 == inputFruit }).first else { throw Errorcase.canNotFound }
        return fruit
    }
    
    
}

enum Errorcase: Error {
    case outOfStock, canNotFound
}
