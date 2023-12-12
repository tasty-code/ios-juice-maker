//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
    var fruitStore = FruitStore()
    
    func makeJuice(_ juice: Juice) throws {
        switch juice {
        case .strawberryJuice:
            try useFruits(fruit: .strawberry, quantity: 16)
        case .bananaJuice:
            try useFruits(fruit: .banana, quantity: 2)
        case .kiwiJuice:
            try useFruits(fruit: .kiwi, quantity: 3)
        case .pineappleJuice:
            try useFruits(fruit: .pineapple, quantity: 2)
        case .strawberryBananaJuice:
            try useFruits(fruit: .strawberry, quantity: 10)
            try useFruits(fruit: .banana, quantity: 1)
        case .mangoJuice:
            try useFruits(fruit: .mango, quantity: 3)
        case .mangoKiwiJuice:
            try useFruits(fruit: .mango, quantity: 2)
            try useFruits(fruit: .kiwi, quantity: 1)
        }
    }
    
    private func useFruits(fruit: Fruit, quantity: Int) throws {
        let currentQuantity = fruitStore.getQuantity(of: fruit)
        guard currentQuantity >= quantity else {
            throw ErrorType.insufficientFruits
        }
        fruitStore.updateInventory(fruit: fruit, quantity: -quantity)
    }
    
//    func useQuantity(fruit: Fruit, quantity: Int, name: String) -> [Fruit] {
////        let currentQuantity = fruitStore.getQuantity(of: fruit.fruitname)
//        if currentQuantity < quantity {
//            return [.strawberry]
//        }
//        return [.pineapple]
//        
//    }
}
