//
//  JuiceMaker - FruitStore.swift
//  Created by 미르 & 미성
//  Copyright © yagom academy. All rights reserved.
//

final class FruitStore {
    private var fruitStock: [Fruit: UInt]
    
    init(fruitStock: [Fruit : UInt] = [.banana: 10, .kiwi: 10, .mango: 10, .pineapple: 10, .strawberry: 10]) {
        self.fruitStock = fruitStock
    }
    
    private func checkStock(juice: Juice) throws {
        for (fruitName, numberOfFruits) in juice.recipe {
            guard let stock = fruitStock[fruitName], stock >= numberOfFruits else { throw JuiceMakerError.outOfStock }
        }
    }
    
    func consumeFruit(juice: Juice) throws {
        try checkStock(juice: juice)
        
        for (fruitName, numberOfFruits) in juice.recipe {
            guard let stock = fruitStock[fruitName] else { throw JuiceMakerError.outOfStock }
            fruitStock[fruitName] = stock - numberOfFruits
        }
    }
    
    private func checkQuantity(fruit: Fruit) -> UInt {
        guard let quantity = fruitStock[fruit] else { return 0 }
        return quantity
    }
    
    func addFruit(fruit: Fruit, num: UInt) {
        let currentStock = checkQuantity(fruit: fruit)
        fruitStock[fruit] = currentStock + num
    }
    
    func subtractFruit(fruit: Fruit, num: UInt) throws {
        let currentStock = checkQuantity(fruit: fruit)
        guard currentStock >= num else { throw JuiceMakerError.outOfStock }
        fruitStock[fruit] = currentStock - num
    }
}
