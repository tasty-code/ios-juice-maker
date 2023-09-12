//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    var fruitStorage: FruitStore = FruitStore(strawberry: FruitStock(currentStock: 10, singleConsumption: 16, combineConsumption: 10), banana: FruitStock(currentStock: 10, singleConsumption: 2, combineConsumption: 1), pineapple: FruitStock(currentStock: 10, singleConsumption: 2), kiwi: FruitStock(currentStock: 10, singleConsumption: 3, combineConsumption: 1), mango: FruitStock(currentStock: 10, singleConsumption: 3, combineConsumption: 2))
    
    func currentStockCheck(_ menu: Juice) -> Bool? {
        switch menu {
        case .strawberryJuice:
            return fruitStorage.strawberry.currentStock < fruitStorage.strawberry.singleConsumption ? false : true
        case .bananaJuice:
            return fruitStorage.banana.currentStock < fruitStorage.banana.singleConsumption ? false : true
        case .kiwiJuice:
            return fruitStorage.kiwi.currentStock < fruitStorage.kiwi.singleConsumption ? false : true
        case .pineappleJuice:
            return fruitStorage.pineapple.currentStock < fruitStorage.pineapple.singleConsumption ? false : true
        case .mangoJuice:
            return fruitStorage.mango.currentStock < fruitStorage.mango.singleConsumption ? false : true
        case .strawberryBananaJuice:
            guard let strawberryConsumption = fruitStorage.strawberry.combineConsumption else{
                return nil
            }
            guard let bananaConsumption = fruitStorage.banana.combineConsumption else{
                return nil
            }
            return fruitStorage.strawberry.currentStock < strawberryConsumption || fruitStorage.banana.currentStock < strawberryConsumption ? false : true
        case .mangoKiwiJuice:
            guard let mangoConsumption = fruitStorage.mango.combineConsumption else{
                return nil
            }
            guard let kiwiConsumption = fruitStorage.kiwi.combineConsumption else{
                return nil
            }
            return fruitStorage.strawberry.currentStock < mangoConsumption || fruitStorage.banana.currentStock < kiwiConsumption ? false : true
        }
    }
}

