//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
    private (set) var fruitStorage = FruitStore()

    func makingJuice(_ order: Juice) -> (message: String, success: Bool) {
        do {
            let complete = try manufacture(juiceName: order)
            if complete {
                print(order.description)
            }
        } catch {
            print(error)
            return (message: "\(error)", success: false )
        }
        return (message:order.description, success: true)
    }

    func getRemainingFruits(_ fruitName: Fruit) throws -> String {
        return try String(fruitStorage.getStockInfo(fruitName))
    }
    
    func getStepperValue(_ fruitName: Fruit) throws -> Double {
        return try Double(fruitStorage.getStockInfo(fruitName))
    }
}

extension JuiceMaker {
    private func soldOutChecker(_ order: Juice) throws -> [Fruit: Int?] {
        var makable: [Fruit: Int?] = [:]
        
        for (fruit, needs) in order.recipe {
            let currentStock = try fruitStorage.getStockInfo(fruit)
            if currentStock >= needs {
                makable.updateValue(needs, forKey: fruit)
            } else {
                makable.updateValue(nil, forKey: fruit)
            }
        }
        return makable
    }
    
    private func errorHandler(_ consumeRecipe: [Fruit: Int?]) throws -> [Fruit: Int] {
        if consumeRecipe.values.filter({ $0 == nil }).count == 2 {
            throw ErrorMessage.stockInsufficients(Array(consumeRecipe.keys))
        }
        if consumeRecipe.values.contains(nil) {
            let nilValues = consumeRecipe.filter { $0.value == nil }.map { $0.key }
            throw ErrorMessage.stockInsufficient(nilValues[0])
        }
        let nonOptionalRecipe = consumeRecipe.compactMapValues({ $0 })
        return nonOptionalRecipe
    }
    
    private func manufacture(juiceName: Juice) throws -> Bool {
        let isSoldout = try soldOutChecker(juiceName)
        let isValid = try errorHandler(isSoldout)
        let isMade = fruitStorage.calculateStock(isValid)
        return isMade
    }
}

