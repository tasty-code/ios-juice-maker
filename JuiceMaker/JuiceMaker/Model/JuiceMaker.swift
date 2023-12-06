//
//  JuiceMaker - JuiceMaker.swift
//  Created by Kyle& L
//  Copyright © yagom academy. All rights reserved.
//

struct JuiceMaker {
    var fruitStore: FruitStore = FruitStore(
        strawberryStock: 10,
        bananaStock: 10,
        pineappleStock: 10,
        kiwiStock: 10,
        mangoStock: 10
    )
    
    func makeJuice(juice: Juice) {
        do {
            try checkUnderstockedFruits(juice: juice)
            for (fruit, count) in juice.recipe {
                fruitStore.useJuiceIngredient(fruit, count: count)
            }
        } catch {
            switch error {
            case JuiceMakerError.outOfStock(let fruit):
                print("\(fruit) 재고 없음")
            default:
                print("알 수 없는 에러 발생")
            }
        }
    }
    
    func checkUnderstockedFruits(juice: Juice) throws {
        var understockedFruits: [String] = []
        var canMakeJuice = true
        
        for (fruit, count) in juice.recipe {
            guard
                hasEnoughStock(for: fruit, count: count)
            else {
                understockedFruits.append(fruit.name)
                canMakeJuice = false
                continue
            }
        }
        
        guard canMakeJuice else {
            let understockedFruit = understockedFruits.joined(separator: ",")
            throw JuiceMakerError.outOfStock(fruit: understockedFruit)
        }
    }
    
    private func hasEnoughStock(for fruit: Fruits, count: Int) -> Bool {
        switch fruit {
        case .strawberry:
            return fruitStore.strawberryStock >= count
        case .banana:
            return fruitStore.bananaStock >= count
        case .pineapple:
            return fruitStore.pineappleStock >= count
        case .kiwi:
            return fruitStore.kiwiStock >= count
        case .mango:
            return fruitStore.mangoStock >= count
        }
    }
}


