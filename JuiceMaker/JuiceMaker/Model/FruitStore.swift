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
    
    struct Fruit: Hashable {
        var name: String
        var stock: Int = 10
    }
    
    func updateFruitStock(inputFruit: Fruit, count: Int) throws {
        
        guard let index = fruitList.firstIndex(where: {$0.name == inputFruit.name}) else {
            throw Errorcase.canNotFound
        }
        
        fruitList[index].stock += count
        print("\(fruitList[index].stock)")
        
    }
    
    
}

enum Errorcase: Error, CustomDebugStringConvertible{
    case outOfStock, canNotFound
    
    var debugDescription: String {
        switch self {
        case .canNotFound: return "해당 과일을 찾을 수 없읍니다."
        case .outOfStock: return "해당 과일의 재고가 부족합니다."
        }
    }
}

