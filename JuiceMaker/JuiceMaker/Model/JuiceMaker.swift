//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation


struct JuiceMaker {
    
    let fruitStore: FruitStore
    
    func checkStock(inputFruit: FruitStore.Fruit, decreaseCount: Int) throws{
        guard inputFruit.stock > abs(decreaseCount) - 1 else {throw Errorcase.outOfStock}
    }
    
    
    func makeJuice(recipeDict: [FruitStore.Fruit: Int]) {
        let fruits = recipeDict.map{$0.key}
        let decreaseCount = recipeDict.map{$0.value}
        
        guard fruits.count < 2 else {
            fruitStore.updateFruitStock(inputFruit: fruits[0], count: decreaseCount[0])
            fruitStore.updateFruitStock(inputFruit: fruits[1], count: decreaseCount[1])
            return
        }
        fruitStore.updateFruitStock(inputFruit: fruits[0], count: decreaseCount[0])
    }
    
   func orderConvertToDictionary(juice: String) throws -> [FruitStore.Fruit: Int] {
        guard let confirmJuice = Recipe(rawValue: juice) else { throw Errorcase.canNotFound }
        return confirmJuice.dereaseDict
        
    }
    
    func convertDecreaseCountArr(fruitDict: [FruitStore.Fruit: Int]) -> [Int] {
        let decreaseCountArr: [Int] = fruitDict.map{$0.value}
        return decreaseCountArr
    }
    
    func convertFruitArr(fruitDict:[FruitStore.Fruit: Int]) -> [FruitStore.Fruit] {
        let fruitArr: [FruitStore.Fruit] = fruitDict.map{$0.key}
        return fruitArr
    }
    
    
    
    
    enum Recipe: String {
        
        case strawberryJuice = "딸기 주스"
        case bananaJuice = "바나나 주스"
        case pineappleJuice = "파인애플 주스"
        case mangoJuice = "망고 주스"
        case kiwiJuice = "키위 주스"
        case strawberryBananaJuice = "딸바 주스"
        case mangoKiwiJuice = "망키 주스"
        
        var dereaseDict: [FruitStore.Fruit: Int] {
            switch self {
            case .strawberryJuice: return [FruitStore.Fruit(name: "딸기"): 16]
            case .bananaJuice: return [FruitStore.Fruit(name: "바나나"): 2]
            case .pineappleJuice: return [FruitStore.Fruit(name: "파인애플"): 2]
            case .mangoJuice: return [FruitStore.Fruit(name: "망고"): 3]
            case .kiwiJuice: return [FruitStore.Fruit(name: "키위"): 3]
            case .strawberryBananaJuice: return [FruitStore.Fruit(name: "딸기"): 10,
                                                 FruitStore.Fruit(name: "바나나"): 1]
            case .mangoKiwiJuice: return [FruitStore.Fruit(name: "망고"): 2,
                                          FruitStore.Fruit(name: "키위"): 1]
            }
        }
    }
}




