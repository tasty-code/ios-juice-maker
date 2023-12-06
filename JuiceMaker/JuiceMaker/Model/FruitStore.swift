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
    
    private func checkStock(fruit: Fruit, num: UInt) throws {
        guard num <= checkQuantity(fruit: fruit) else { throw JuiceMakerError.outOfStock
        }
    }
    
    func consumeFruit(fruit: Fruit, num: UInt) throws {
        try checkStock(fruit: fruit, num: num)
        subtractFruit(fruit: fruit, num: num)
    }
    
    private func checkQuantity(fruit: Fruit) -> UInt {
        guard let quantity = fruitStock[fruit] else { return 0 }
        return quantity
    }
    
    func addFruit(fruit: Fruit, num: UInt) {
        let currentStock = checkQuantity(fruit: fruit)
        fruitStock[fruit] = currentStock + num
    }
    
    private func subtractFruit(fruit: Fruit, num: UInt) {
        let currentStock = checkQuantity(fruit: fruit)
        fruitStock[fruit] = currentStock - num
    }
}
