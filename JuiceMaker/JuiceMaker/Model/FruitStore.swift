//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    
    var fruitList: [Fruit]
    
    init(fruits: [Fruit]) {
        self.fruitList = fruits
    }
    
    struct Fruit: Equatable {
        var name: String
        var stock: Int = 10
    }
    
    func containsFruits(inputFruit: Fruit) throws {
        guard let fruit = fruitList.filter({ $0 == inputFruit }).first else { throw Errorcase.canNotFound }
        
    }
    
    func updateFruitStock(inputFruit: Fruit, count: Int) {
        
        guard let index = fruitList.firstIndex(where: {$0 == inputFruit}) else { return }
        
        fruitList[index].stock = inputFruit.stock + count
        
    }
    
    
}

enum Errorcase: Error {
    case outOfStock, canNotFound
}
