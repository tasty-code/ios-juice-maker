//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    var fruitStorage: FruitStore = FruitStore(strawberry: FruitStock(currentStock: 10, singleConsumption: 16, combineConsumption: 10), banana: FruitStock(currentStock: 10, singleConsumption: 2, combineConsumption: 1), pineapple: FruitStock(currentStock: 10, singleConsumption: 2), kiwi: FruitStock(currentStock: 10, singleConsumption: 3, combineConsumption: 1), mango: FruitStock(currentStock: 10, singleConsumption: 3, combineConsumption: 2))
    
    func currentStockCheck(_ menu: Juice) {
        switch menu {
        case .strawberryJuice:
            if fruitStorage.strawberry.currentStock >= fruitStorage.strawberry.singleConsumption {
                fruitStorage.stockCalculater(.strawberryJuice)
            }
        case .bananaJuice:
            if fruitStorage.banana.currentStock >= fruitStorage.banana.singleConsumption {
                fruitStorage.stockCalculater(.bananaJuice)
            }
        case .kiwiJuice:
                    if fruitStorage.kiwi.currentStock >= fruitStorage.kiwi.singleConsumption {
                        fruitStorage.stockCalculater(.kiwiJuice)
                    }
        case .pineappleJuice:
                    if fruitStorage.pineapple.currentStock >= fruitStorage.pineapple.singleConsumption {
                        fruitStorage.stockCalculater(.pineappleJuice)
                    }
        case .mangoJuice:
                    if fruitStorage.mango.currentStock >= fruitStorage.mango.singleConsumption {
                        fruitStorage.stockCalculater(.mangoJuice)
                    }
        case .strawberryBananaJuice:
            guard let strawberryConsumption = fruitStorage.strawberry.combineConsumption else{
                return
            }
            guard let bananaConsumption = fruitStorage.banana.combineConsumption else{
                return
            }
            if fruitStorage.strawberry.currentStock >= strawberryConsumption && fruitStorage.banana.currentStock >= bananaConsumption {
                fruitStorage.stockCalculater(.strawberryBananaJuice)
            }
        case .mangoKiwiJuice:
            guard let mangoConsumption = fruitStorage.mango.combineConsumption else{
                return
            }
            guard let kiwiConsumption = fruitStorage.kiwi.combineConsumption else{
                return
            }
            if fruitStorage.mango.currentStock >= mangoConsumption && fruitStorage.kiwi.currentStock >= kiwiConsumption {
                fruitStorage.stockCalculater(.mangoKiwiJuice)
            }
        }
    }
}

