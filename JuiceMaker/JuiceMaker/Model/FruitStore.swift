//
//  JuiceMaker - FruitStore.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

@frozen enum JuiceType {
    case strawberryJuice, bananaJuice, kiwiJuice, pineappleJuice, strawberryBananaMixJuice, mangoJuice, mangokiwiJuice
}

@frozen enum FruitType {
    case strawberry, banana, kiwi, pineapple, mango
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
    private var fruits: [Fruit] = [
        Fruit(.strawberry, 10),
        Fruit(.banana, 10),
        Fruit(.kiwi, 10),
        Fruit(.pineapple, 10),
        Fruit(.mango, 10)
    ]
    
    func receiveOrder(juiceType: JuiceType) {
        switch juiceType {
        case .strawberryJuice:
            makeJuice(Fruit(.strawberry, 16))
        case .strawberryBananaMixJuice:
            makeJuice(Fruit(.strawberry, 10),Fruit(.banana, 1))
        case .bananaJuice:
            makeJuice(Fruit(.banana, 2))
        case .kiwiJuice:
            makeJuice(Fruit(.kiwi, 3))
        case .pineappleJuice:
            makeJuice(Fruit(.pineapple, 2))
        case .mangoJuice:
            makeJuice(Fruit(.mango, 3))
        case .mangokiwiJuice:
            makeJuice(Fruit(.mango, 2), Fruit(.kiwi, 1))
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
}
