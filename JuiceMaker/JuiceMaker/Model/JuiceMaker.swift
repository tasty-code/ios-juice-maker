//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation


struct JuiceMaker {
    
    let fruitStore: FruitStore
    

    
    func startOrder(juiceTag: Int) throws {
        let fruitDict: [String: Int] = try orderConvertToDict(juiceTag: juiceTag)
        
        try checkStock(juiceIngredient: fruitDict)
        try makeJuice(juiceIngredient: fruitDict)

    }
    
    
    private func checkStock(juiceIngredient: [String: Int]) throws {
        try juiceIngredient.forEach { fruit, count in
            guard let listIndex = fruitStore.fruitList.firstIndex(where: {$0.name == fruit}) else {
                throw MessageLog.ErrorCase.canNotFound
            }
            guard fruitStore.fruitList[listIndex].stock > count - 1 else {throw MessageLog.ErrorCase.outOfStock}

        }

    }
    
    
    private func makeJuice(juiceIngredient: [String: Int]) throws {
        try juiceIngredient.forEach { fruit, count in
            try subtractFruitStock(inputFruit: fruit, count: count)
        }
    }
    
    
    private func orderConvertToDict(juiceTag: Int) throws -> [String: Int] {
        
        guard let confirmJuice = Recipe(rawValue: juiceTag) else { throw MessageLog.ErrorCase.canNotFound }
        
        return confirmJuice.juiceIngredient
    }
    
    
    
    private func subtractFruitStock(inputFruit: String, count: Int) throws {
        guard let index = fruitStore.fruitList.firstIndex(where: {$0.name == inputFruit}) else {
            throw MessageLog.ErrorCase.canNotFound
        }
        
        fruitStore.fruitList[index].stock -= count
    }
    
    enum Recipe: Int {
        
        case strawberryJuiceTag = 0
        case bananaJuiceTag = 1
        case pineappleJuiceTag = 2
        case mangoJuiceTag = 3
        case kiwiJuiceTag = 4
        case strawberryBananaJuiceTag = 5
        case mangoKiwiJuiceTag = 6
        
        var juiceIngredient: [String: Int] {
            switch self {
            case .strawberryJuiceTag:
                return ["딸기": 16]
                
            case .bananaJuiceTag:
                return ["바나나": 2]
                
            case .pineappleJuiceTag:
                return ["파인애플": 2]
                
            case .mangoJuiceTag:
                return ["망고": 3]
                
            case .kiwiJuiceTag:
                return ["키위": 3]
                
            case .strawberryBananaJuiceTag:
                return ["딸기": 10,
                        "바나나": 1]
                
            case .mangoKiwiJuiceTag:
                return ["망고": 2,
                        "키위": 1]
            }
            
        }
        var juiceName: String {
            switch self {
                
            case .strawberryJuiceTag:
               return "딸기 주스"
            case .bananaJuiceTag:
                return "바나나 주스"
            case .pineappleJuiceTag:
                return "파인애플 주스"
            case .mangoJuiceTag:
                return "망고 주스"
            case .kiwiJuiceTag:
                return "키위 주스"
            case .strawberryBananaJuiceTag:
                return "딸바 주스"
            case .mangoKiwiJuiceTag:
                return "망키 주스"
            }
        }
    }
}




