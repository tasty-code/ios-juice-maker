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
        let strawberry = fruitStorage.strawberry
        let banana = fruitStorage.banana
        let kiwi = fruitStorage.kiwi
        let pineapple = fruitStorage.pineapple
        let mango = fruitStorage.mango
        
        switch menu {
        case .strawberryJuice:
            if strawberry.currentStock >= strawberry.singleConsumption {
                fruitStorage.stockCalculater(.strawberryJuice)
            }
        case .bananaJuice:
            if banana.currentStock >= banana.singleConsumption {
                fruitStorage.stockCalculater(.bananaJuice)
            }
        case .kiwiJuice:
            if kiwi.currentStock >= kiwi.singleConsumption {
                fruitStorage.stockCalculater(.kiwiJuice)
            }
        case .pineappleJuice:
            if pineapple.currentStock >= pineapple.singleConsumption {
                fruitStorage.stockCalculater(.pineappleJuice)
            }
        case .mangoJuice:
            if mango.currentStock >= mango.singleConsumption {
                fruitStorage.stockCalculater(.mangoJuice)
            }
        case .strawberryBananaJuice:
            guard let strawberryConsumption = strawberry.combineConsumption else{
                return
            }
            guard let bananaConsumption = banana.combineConsumption else{
                return
            }
            if strawberry.currentStock < strawberryConsumption {
                print("딸기 재고가 부족합니다.")
                break
            }
            if banana.currentStock < bananaConsumption {
                print("바나나 재고가 부족합니다.")
                break
            }
            fruitStorage.stockCalculater(.strawberryBananaJuice)
        case .mangoKiwiJuice:
            guard let mangoConsumption = mango.combineConsumption else{
                return
            }
            guard let kiwiConsumption = kiwi.combineConsumption else{
                return
            }
            if mango.currentStock < mangoConsumption {
                print("망고 재고가 부족합니다.")
                break
            }
                
            if kiwi.currentStock < kiwiConsumption {
                print("키위 재고가 부족합니다.")
                break
            }
            fruitStorage.stockCalculater(.mangoKiwiJuice)
        }
    }
}

