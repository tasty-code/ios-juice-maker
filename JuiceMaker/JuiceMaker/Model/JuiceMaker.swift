//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation


struct JuiceMaker {
    
    let fruitStore: FruitStore
    
    func startOrder(juiceName: String) {
        
        do {
            let fruitDict: [FruitStore.Fruit: Int] = try orderConvertToDict(juice: juiceName)
            
            try checkStock(juiceIngredient: fruitDict)
            try makeJuice(juiceIngredient: fruitDict)
            
        } catch {
            debugPrint(error)
        }
    }
    
    
    private func checkStock(juiceIngredient: [FruitStore.Fruit: Int]) throws {
        try juiceIngredient.forEach { fruit, count in
            guard let listIndex = fruitStore.fruitList.firstIndex(where: {$0.name == fruit.name}) else {
                throw MessageLog.ErrorCase.canNotFound
            }
            guard fruitStore.fruitList[listIndex].stock > count - 1 else {throw MessageLog.ErrorCase.outOfStock}
        }

    }
    
    
    private func makeJuice(juiceIngredient: [FruitStore.Fruit: Int]) throws {
        try juiceIngredient.forEach { fruit, count in
            try subtractFruitStock(inputFruit: fruit, count: count)
        }
    }
    
    
    private func orderConvertToDict(juice: String) throws -> [FruitStore.Fruit: Int] {
        
        guard let confirmJuice = Recipe(rawValue: juice) else { throw MessageLog.ErrorCase.canNotFound }
        
        return confirmJuice.juiceIngredient
    }
    
    
    
    private func subtractFruitStock(inputFruit: FruitStore.Fruit, count: Int) throws {
        guard let index = fruitStore.fruitList.firstIndex(where: {$0.name == inputFruit.name}) else {
            throw MessageLog.ErrorCase.canNotFound
        }
        
        fruitStore.fruitList[index].stock -= count
    }
    
    private enum Recipe: String {
        
        case strawberryJuice = "딸기 주스"
        case bananaJuice = "바나나 주스"
        case pineappleJuice = "파인애플 주스"
        case mangoJuice = "망고 주스"
        case kiwiJuice = "키위 주스"
        case strawberryBananaJuice = "딸바 주스"
        case mangoKiwiJuice = "망키 주스"
        
        var juiceIngredient: [FruitStore.Fruit: Int] {
            switch self {
            case .strawberryJuice:
                return [FruitStore.Fruit(name: "딸기"): 16]
                
            case .bananaJuice:
                return [FruitStore.Fruit(name: "바나나"): 2]
                
            case .pineappleJuice:
                return [FruitStore.Fruit(name: "파인애플"): 2]
                
            case .mangoJuice:
                return [FruitStore.Fruit(name: "망고"): 3]
                
            case .kiwiJuice:
                return [FruitStore.Fruit(name: "키위"): 3]
                
            case .strawberryBananaJuice:
                return [FruitStore.Fruit(name: "딸기"): 10,
                        FruitStore.Fruit(name: "바나나"): 1]
                
            case .mangoKiwiJuice:
                return [FruitStore.Fruit(name: "망고"): 2,
                        FruitStore.Fruit(name: "키위"): 1]
            }
        }
    }
}




