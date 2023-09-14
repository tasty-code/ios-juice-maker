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
    
    func combineJuiceSoldOutChecker(_ firstFruit: FruitStock, _ secondFruit: FruitStock, _ juice: Juice) throws -> Juice {
        guard let firstConsumption = firstFruit.combineConsumption else {
            throw ErrorPrinter.invalidInput
        }
        guard let secondConsumption = secondFruit.combineConsumption else {
            throw ErrorPrinter.invalidInput
        }
        guard firstFruit.currentStock >= firstConsumption || secondFruit.currentStock >= secondConsumption else {
            throw ErrorPrinter.stockInsufficients([firstFruit.name, secondFruit.name])
        }
        guard firstFruit.currentStock >= firstConsumption else {
            throw ErrorPrinter.stockInsufficient(firstFruit.name)
        }
        guard secondFruit.currentStock >= secondConsumption else {
            throw ErrorPrinter.stockInsufficient(secondFruit.name)
        }
        
        return juice
    }

    private func soldOutChecker(_ menu: Juice) throws -> Juice {
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
            return try combineJuiceSoldOutChecker(fruitStorage.strawberry, fruitStorage.banana, .strawberryBananaJuice)
        case .mangoKiwiJuice:
            return try combineJuiceSoldOutChecker(fruitStorage.mango, fruitStorage.kiwi, .mangoKiwiJuice)
        }
    }
}
