//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    private var strawberry: FruitStock
    private var banana: FruitStock
    private var pineapple: FruitStock
    private var kiwi: FruitStock
    private var mango: FruitStock
    
    init(strawberry: FruitStock = FruitStock(name: "딸기", singleConsumption: 16, combineConsumption: 10),
         banana: FruitStock = FruitStock(name: "바나나", singleConsumption: 2, combineConsumption: 1),
         pineapple: FruitStock = FruitStock(name: "파인애플", singleConsumption: 2),
         kiwi: FruitStock = FruitStock(name: "키위", singleConsumption: 3, combineConsumption: 1),
         mango: FruitStock = FruitStock(name: "망고", singleConsumption: 3, combineConsumption: 2)
    ) {
        self.strawberry = strawberry
        self.banana = banana
        self.pineapple = pineapple
        self.kiwi = kiwi
        self.mango = mango
    }
    
    func showStockList(_ fruit: Juice) -> [FruitStock] {
        switch fruit {
        case .strawberryJuice:
            return [strawberry]
        case .bananaJuice:
            return [banana]
        case .kiwiJuice:
            return [kiwi]
        case .pineappleJuice:
            return [pineapple]
        case .mangoJuice:
            return [mango]
        case .strawberryBananaJuice:
            return [strawberry, banana]
        case .mangoKiwiJuice:
            return [mango, kiwi]
        }
    }
    
    func changeCurrentStock(_ juiceName: Juice) {
        stockCalculator(juiceName)
    }
    
    private func stockCalculator(_ juiceName: Juice) {
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
            guard let strawberryConsumption = strawberry.combineConsumption else {
                return
            }
            guard let bananaConsumption = banana.combineConsumption else {
                return
            }
            strawberry.currentStock -= strawberryConsumption
            banana.currentStock -= bananaConsumption
        case .mangoKiwiJuice:
            guard let mangoConsumption = mango.combineConsumption else {
                return
            }
            guard let kiwiConsumption = kiwi.combineConsumption else {
                return
            }
            mango.currentStock -= mangoConsumption
            kiwi.currentStock -= kiwiConsumption
        }
        print(juiceName.description)
    }
    
    private func stockManager(_ fruit: String) {
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
