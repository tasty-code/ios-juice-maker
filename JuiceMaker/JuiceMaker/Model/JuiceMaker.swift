//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    var fruitStorage = FruitStore()

    func makeJuice(_ order: Juice) {
        do {
            let getOrder = try soldOutChecker(order)
            fruitStorage.stockCalculator(getOrder)
        } catch {
            print(error)
        }
    }
        
    func juiceSoldOutChecker(_ fruit: FruitStock, _ juice: Juice) throws -> Juice {
        guard fruit.currentStock >= fruit.singleConsumption else {
            throw ErrorPrinter.stockInsufficient(fruit.name)
        }
        return juice
    }
    
    func combineJuiceSoldOutChecker(_ firstFruit: FruitStock, _secondFruit: FruitStock, _ juice: Juice) throws -> Juice {
        guard let firstConsumption = firstFruit.combineConsumption else {
            throw ErrorPrinter.invalidInput
        }
        guard let secondConsumption = _secondFruit.combineConsumption else {
            throw ErrorPrinter.invalidInput
        }
        
        if firstFruit.currentStock < firstConsumption {
        }
        if _secondFruit.currentStock < secondConsumption {
        }
        return juice
    }

    private func soldOutChecker(_ menu: Juice) throws -> Juice {
        let strawberry = fruitStorage.strawberry
        let banana = fruitStorage.banana
        let kiwi = fruitStorage.kiwi
        let pineapple = fruitStorage.pineapple
        let mango = fruitStorage.mango
        
        switch menu {
        case .strawberryJuice:
            return try juiceSoldOutChecker(fruitStorage.strawberry, .strawberryJuice)
        case .bananaJuice:
            return try juiceSoldOutChecker(fruitStorage.banana, .bananaJuice)
        case .kiwiJuice:
            return try juiceSoldOutChecker(fruitStorage.kiwi, .kiwiJuice)
        case .pineappleJuice:
            return try juiceSoldOutChecker(fruitStorage.pineapple, .pineappleJuice)
        case .mangoJuice:
            return try juiceSoldOutChecker(fruitStorage.mango, .mangoJuice)
        case .strawberryBananaJuice:
            guard let strawberryConsumption = strawberry.combineConsumption else {
                throw ErrorPrinter.invalidInput
            }
            guard let bananaConsumption = banana.combineConsumption else {
                throw ErrorPrinter.invalidInput
            }
            
           
//            guard insufficient.isEmpty else {
//                throw ErrorPrinter.stockInsufficient(insufficient)
//            }
            return .strawberryBananaJuice
        case .mangoKiwiJuice:
            guard let mangoConsumption = mango.combineConsumption else {
                throw ErrorPrinter.invalidInput
            }
            guard let kiwiConsumption = kiwi.combineConsumption else {
                throw ErrorPrinter.invalidInput
            }
            
            var insufficient: [String] = []
            
            if mango.currentStock < mangoConsumption {
                insufficient.append("망고")
            }
            if kiwi.currentStock < kiwiConsumption {
                insufficient.append("키위")
            }
//            guard insufficient.isEmpty else {
//                throw ErrorPrinter.stockInsufficient(insufficient)
//            }
            return .mangoKiwiJuice
        }
    }
    
    
 
    
 
    
}
