//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    var strawberry: FruitStock
    var banana: FruitStock
    var pineapple: FruitStock
    var kiwi: FruitStock
    var mango: FruitStock
    
    init(strawberry: FruitStock, banana: FruitStock, pineapple: FruitStock, kiwi: FruitStock, mango: FruitStock) {
        self.strawberry = strawberry
        self.banana = banana
        self.pineapple = pineapple
        self.kiwi = kiwi
        self.mango = mango
    }
    
    func stockCalculater(_ juiceName: Juice) {
        switch juiceName {
        case .strawberryJuice:
            strawberry.currentStock -= strawberry.singleConsumption
        case .bananaJuice:
            banana.currentStock -= banana.singleConsumption
        case .kiwiJuice:
            kiwi.currentStock -= kiwi.singleConsumption
        case .pineappleJuice:
            pineapple.currentStock -= pineapple.singleConsumption
        case .mangoJuice:
            mango.currentStock -= mango.singleConsumption
        case .strawberryBananaJuice:
            guard let strawberryConsumption = strawberry.combineConsumption else{
                return
            }
            guard let bananaConsumption = banana.combineConsumption else{
                return
            }
            strawberry.currentStock -= strawberryConsumption
            banana.currentStock -= bananaConsumption
        case .mangoKiwiJuice:
            guard let mangoConsumption = mango.combineConsumption else{
                return
            }
            guard let kiwiConsumption = kiwi.combineConsumption else{
                return
            }
            mango.currentStock -= mangoConsumption
            kiwi.currentStock -= kiwiConsumption
        }
    }
}

