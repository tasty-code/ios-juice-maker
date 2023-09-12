//
//  JuiceMaker - FruitStore.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

@frozen enum JuiceType {
    case strawberryJuice, strawberryBananaMixJuice
}

@frozen enum FruitType {
    case strawberry, banana
}

struct Fruit {
    let fruitType: FruitType
    let quantity: Int
    
    init(_ fruitType: FruitType, _ quantity: Int) {
        self.fruitType = fruitType
        self.quantity = quantity
    }
    
    func updateQuantity(to quantity: Int) -> Fruit {
        return Fruit(self.fruitType, quantity)
    }
}

final class FruitStore {
    // Fruits Properties
    private var fruits: [Fruit] = [
        Fruit(.strawberry, 10),
        Fruit(.banana, 10),
    ]
    
    // 주문 받은 것대로 재고 빼기
    func receiveOrder(juiceType: JuiceType) {
        switch juiceType {
        case .strawberryJuice:
            makeJuice(Fruit(.strawberry, 16))
        case .strawberryBananaMixJuice:
            break
            
        }
    }
}

// MARK: Private methods
extension FruitStore {
    private func makeJuice(_ ingredient: Fruit) {
        guard validateQuantity(ingredient: ingredient) else { return }
        updateFruit(fruit: ingredient)
    }
    
    private func makeJuice(_ firstIngredient: Fruit, _ secondIngredient: Fruit) {
        guard validateQuantity(ingredient: firstIngredient), validateQuantity(ingredient: secondIngredient) else { return }
        updateFruit(fruit: firstIngredient)
        updateFruit(fruit: secondIngredient)
    }
    
    private func validateQuantity(ingredient: Fruit) -> Bool {
        guard let fruit = fruits.filter({$0.fruitType == ingredient.fruitType}).first else { return false }
        return fruit.quantity - ingredient.quantity >= 0
    }
    
    private func updateFruit(fruit: Fruit) {
        guard let index = fruits.firstIndex(where: {$0.fruitType == fruit.fruitType}) else { return }
        let target = fruits[index]
        let newQuantity = target.quantity - fruit.quantity
        fruits[index] = target.updateQuantity(to: newQuantity)
    }
    
    private func addQuantity(fruit: Fruit, quantity: Int = 1) {
        
    }
    
    private func substractQuantity(fruit: Fruit, to quantity: Int = 1) {
        
    }
}
