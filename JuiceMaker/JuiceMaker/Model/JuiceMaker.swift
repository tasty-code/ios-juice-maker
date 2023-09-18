//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    var fruitStorage = FruitStore()

    func getOrder(_ order: Juice) -> [Fruit : Int?] {
        var makable: [Fruit : Int?] = [:]
        do {
            for (fruit, needs) in order.recipe {
                let currentStock = try fruitStorage.getStockInfo(fruit)
                if currentStock >= needs {
                    makable.updateValue(needs, forKey: fruit)
                } else {
                    makable.updateValue(nil, forKey: fruit)
                }
            }
            let complete = try fruitStorage.makeJuice(makable)
            if complete {
                print(order.description)
            }
        } catch {
            print(error)
        }
        return makable
    }
}

