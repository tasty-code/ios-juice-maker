//
//  FruitType.swift
//  JuiceMaker
//
//  Created by Swain Yun on 2023/09/12.
//

import Foundation

@frozen enum FruitType {
    case strawberry, banana, kiwi, pineapple, mango
}

struct Fruit {
    private let fruitType: FruitType
    private let quantity: Int
    
    init(_ fruitType: FruitType, _ quantity: Int) {
        self.fruitType = fruitType
        self.quantity = quantity
    }
    
    func showFruitType() -> FruitType {
        return self.fruitType
    }
    
    func showQuantity() -> Int {
        return self.quantity
    }
    
    func updateFruit(for quantity: Int) -> Fruit {
        return Fruit(self.fruitType, quantity)
    }
    
    func quantityDistance(target fruit: Self) -> Int {
        return self.quantity - fruit.quantity
    }
}
