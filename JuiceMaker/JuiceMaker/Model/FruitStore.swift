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
    
    
    func updateFruitStock(inputFruit: Fruit, count: Int) throws {
        
        guard let index = fruitList.firstIndex(where: {$0.name == inputFruit.name}) else {
            throw Errorcase.canNotFound
        }
        
        fruitList[index].stock += count
    }
    
}



extension FruitStore {
    
    struct Fruit: Hashable {
        var name: String
        var stock: Int = 10
    }
    
}




