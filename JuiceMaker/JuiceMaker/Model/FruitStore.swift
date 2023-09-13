//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    static let shared = FruitStore(
        strawberry: FruitStock(singleConsumption: 16, combineConsumption: 10),
        banana: FruitStock(singleConsumption: 2, combineConsumption: 1),
        pineapple: FruitStock(singleConsumption: 2),
        kiwi: FruitStock(singleConsumption: 3, combineConsumption: 1),
        mango: FruitStock(singleConsumption: 3, combineConsumption: 2)
    )
    
    var strawberry: FruitStock
    var banana: FruitStock
    var pineapple: FruitStock
    var kiwi: FruitStock
    var mango: FruitStock
    
    private init(strawberry: FruitStock, banana: FruitStock, pineapple: FruitStock, kiwi: FruitStock, mango: FruitStock) {
        self.strawberry = strawberry
        self.banana = banana
        self.pineapple = pineapple
        self.kiwi = kiwi
        self.mango = mango
    }
    
    func stockCalculator(_ juiceName: Juice) {
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

        print(juiceName.message)
    }
    
    func stockManager(_ fruit: String) {
        switch fruit {
        case "strawberryAdd":
            strawberry.currentStock += 1
        case "strawberrySubtract":
            strawberry.currentStock -= 1
        case "bananaAdd":
            banana.currentStock += 1
        case "bananaSubtract":
            banana.currentStock -= 1
        case "pineappleAdd":
            pineapple.currentStock += 1
        case "pineappleSubtract":
            pineapple.currentStock -= 1
        case "mangoAdd":
            mango.currentStock += 1
        case "mangoSubtract":
            mango.currentStock -= 1
        case "kiwiAdd":
            kiwi.currentStock += 1
        case "kiwiSubtract":
            kiwi.currentStock -= 1
        default:
            break
        }
    }
}
