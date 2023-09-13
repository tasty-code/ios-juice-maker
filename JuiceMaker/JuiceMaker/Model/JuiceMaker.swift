//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    var fruitStorage = FruitStore.shared
    
    func soldOutChecker(_ menu: Juice) -> Juice? {
        let strawberry = fruitStorage.strawberry
        let banana = fruitStorage.banana
        let kiwi = fruitStorage.kiwi
        let pineapple = fruitStorage.pineapple
        let mango = fruitStorage.mango
        
        switch menu {
        case .strawberryJuice:
            return strawberry.currentStock >= strawberry.singleConsumption ? .strawberryJuice : nil
        case .bananaJuice:
            return banana.currentStock >= banana.singleConsumption ? .bananaJuice : nil
        case .kiwiJuice:
            return  kiwi.currentStock >= kiwi.singleConsumption ? .kiwiJuice : nil
        case .pineappleJuice:
        return  pineapple.currentStock >= pineapple.singleConsumption ? .pineappleJuice : nil
        case .mangoJuice:
            return  mango.currentStock >= mango.singleConsumption ? .mangoJuice : nil
        case .strawberryBananaJuice:
            guard let strawberryConsumption = strawberry.combineConsumption else {
                return nil
            }
            guard let bananaConsumption = banana.combineConsumption else {
                return nil
            }
            if strawberry.currentStock < strawberryConsumption {
                print("딸기 재고가 부족합니다.")
                break
            }
            if banana.currentStock < bananaConsumption {
                print("바나나 재고가 부족합니다.")
                return nil
            }
            return .strawberryBananaJuice
        case .mangoKiwiJuice:
            guard let mangoConsumption = mango.combineConsumption else {
                return nil
            }
            guard let kiwiConsumption = kiwi.combineConsumption else {
                return nil
            }
            if mango.currentStock < mangoConsumption {
                print("망고 재고가 부족합니다.")
                break
            }
            if kiwi.currentStock < kiwiConsumption {
                print("키위 재고가 부족합니다.")
                return nil
            }
            return .mangoKiwiJuice
        }
        return nil
    }
}
