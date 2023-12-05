//
//  JuiceMaker - JuiceMaker.swift
//  Created by Kyle& L
//  Copyright © yagom academy. All rights reserved.
//

struct JuiceMaker {
    
    private var fruitStore: FruitStore = FruitStore()
    
    func makeJuice(juice: Juice) {
        guard hasEnoughStock(juice: juice) else { return print("재고 없음")}
        for (fruit, count) in juice.recipe {
            fruitStore.useJuiceIngredient(fruit, count: count)
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


