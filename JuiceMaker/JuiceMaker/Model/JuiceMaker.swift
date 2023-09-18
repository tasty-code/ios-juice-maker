//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    private var fruitStorage = FruitStore()

    func getOrder(_ order: Juice) {
        do {
            let makable: [Fruit : Int?] = try soldOutChecker(order)
            let complete = try fruitStorage.errorHandler(makable)
            if complete {
                print(order.description)
            }
        } catch {
            print(error)
        }
    }
    
    func passCurrentList() -> [Fruit : Int] {
        return fruitStorage.showCurrentList()
    }
    
    private func soldOutChecker(_ order: Juice) throws -> [Fruit : Int?] {
        var makable: [Fruit : Int?] = [:]
        
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
}

