//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    
    var fruitList: [Fruit]
    
    init(fruitList: [Fruit]) {
        self.fruitList = fruitList
    }
    
    
    func addFruitStock(inputFruit: Fruit, count: Int) throws {
        
        guard let index = fruitList.firstIndex(where: {$0.name == inputFruit.name}) else {
            throw MessageLog.ErrorCase.canNotFound
        }
        
        fruitList[index].stock = count
    }
    
    
    func takeFruitStock(fruitName: String) throws -> Int {
        guard let fruit = fruitList.filter({$0.name == fruitName}).first else { throw MessageLog.ErrorCase.canNotFound }
        
        return fruit.stock
    }
}



extension FruitStore {
    
    struct Fruit: Hashable {
        var name: String
        var stock: Int = 10
    }
    
}




