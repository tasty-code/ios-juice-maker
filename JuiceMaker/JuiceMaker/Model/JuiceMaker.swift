//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    var fruitStorage = FruitStore.shared
    
    func makeJuice(_ order: Juice) {
        do {
            let getOrder = try soldOutChecker(order)
            fruitStorage.stockCalculater(getOrder)
        } catch {
            print(error)
        }
    }
    
    private func soldOutChecker(_ menu: Juice) throws -> Juice? {
        let strawberry = fruitStorage.strawberry
        let banana = fruitStorage.banana
        let kiwi = fruitStorage.kiwi
        let pineapple = fruitStorage.pineapple
        let mango = fruitStorage.mango
        
        switch menu {
        case .strawberryJuice:
            guard strawberry.currentStock >= strawberry.singleConsumption else {
                throw ErrorPrinter.stockInsufficient(["딸기"])
            }
            return .strawberryJuice
        case .bananaJuice:
            guard banana.currentStock >= banana.singleConsumption else {
                throw ErrorPrinter.stockInsufficient(["바나나"])
            }
            return .bananaJuice
        case .kiwiJuice:
            guard kiwi.currentStock >= kiwi.singleConsumption else {
                throw ErrorPrinter.stockInsufficient(["키위"])
            }
            return .kiwiJuice
        case .pineappleJuice:
            guard pineapple.currentStock >= pineapple.singleConsumption else {
                throw ErrorPrinter.stockInsufficient(["파인애플"])
            }
        return .pineappleJuice
        case .mangoJuice:
            guard mango.currentStock >= mango.singleConsumption else {
                throw ErrorPrinter.stockInsufficient(["망고"])
            }
            return .mangoJuice
        case .strawberryBananaJuice:
            guard let strawberryConsumption = strawberry.combineConsumption else {
                throw ErrorPrinter.invalidInput
            }
            guard let bananaConsumption = banana.combineConsumption else {
                throw ErrorPrinter.invalidInput
            }
            
            var insufficient: [String] = []
            
            if strawberry.currentStock < strawberryConsumption {
                insufficient.append("딸기")
            }
            if banana.currentStock < bananaConsumption {
                insufficient.append("바나나")
            }
            guard insufficient.isEmpty else {
                throw ErrorPrinter.stockInsufficient(insufficient)
            }
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
            guard insufficient.isEmpty else {
                throw ErrorPrinter.stockInsufficient(insufficient)
            }
            return .mangoKiwiJuice
        }
        return nil
    }
}
