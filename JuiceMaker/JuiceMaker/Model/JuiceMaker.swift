//
//  JuiceMaker - JuiceMaker.swift
//  Created by Kyle& L
//  Copyright © yagom academy. All rights reserved.
//
import UIKit
struct JuiceMaker {
    
    var fruitStore: FruitStore = FruitStore()
    
    
    func makeJuice(juice: Juice) {
        var understockedFruits: [String] = []
        for (fruit, count) in juice.recipe {
            guard
                hasEnoughStock(juice: juice)
            else {
                understockedFruits.append(fruit.name)
                continue
            }
            fruitStore.useJuiceIngredient(fruit, count: count)
        }
        guard understockedFruits.isEmpty else {
            let understockedFruit = understockedFruits.map{$0}.joined(separator: ",")
            print("\(understockedFruit) 재고 없음")
            return
        }
    }
    
    func hasEnoughStock(juice: Juice) -> Bool {
        switch juice {
        case .strawberryJuice:
            return fruitStore.strawberryStock >= 16
        case .bananaJuice:
            return fruitStore.bananaStock >= 2
        case .pineappleJuice:
            return fruitStore.pineappleStock >= 2
        case .kiwiJuice:
            return fruitStore.kiwiStock >= 3
        case .mangoJuice:
            return fruitStore.mangoStock >= 3
        case .strawberryBananaJuice:
            return fruitStore.strawberryStock >= 10 && fruitStore.bananaStock >= 1
        case .mangoKiwiJuice:
            return fruitStore.mangoStock >= 2 && fruitStore.kiwiStock >= 1
        }
    }
}


