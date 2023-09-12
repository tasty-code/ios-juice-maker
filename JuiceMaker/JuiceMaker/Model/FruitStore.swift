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
    
    func updateFruitStock(inputFruit: Fruit, count: Int) {
        
        guard let index = fruitList.firstIndex(where: {$0.name == inputFruit.name}) else {
            print("여기서 걸림")
            return }
        
        fruitList[index].stock += count
        print("\(fruitList[index].stock)")
        
    }
    
    
}

enum Errorcase: Error {
    case outOfStock, canNotFound
}
