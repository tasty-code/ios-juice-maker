//
//  JuiceMaker - FruitStore.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    private var fruitInventory: [String: Int] = [
        "딸기": 10,
        "바나나": 10,
        "파인애플": 10,
        "키위": 10,
        "망고": 10
    ]
    
    private func displayCurrentFruitInventory(fruit: String, quantity: Int) {
        guard let currentQuantity = fruitInventory[fruit] else {
            print("과일저장오류")
            return
        }
        let updatedQuantity = currentQuantity
        fruitInventory[fruit] = updatedQuantity
        print("재고변경.\(fruit): \(updatedQuantity)")
    }
    
    func updateFruitQuantity(fruit: String, quantity: Int) throws {
        guard var currentQuantity = fruitInventory[fruit] else {
            throw fruitStoreError.currentQuantityError
        }
        currentQuantity = quantity
        if currentQuantity <= 0 {
            throw fruitStoreError.fruitQuantityError
        }
        fruitInventory[fruit] = currentQuantity
        displayCurrentFruitInventory(fruit: fruit, quantity: currentQuantity)
    }

    func checkAvailability(for juiceIngredients: [String: Int]) -> Bool {
        for (fruit, requiredQuantity) in juiceIngredients {
            guard let availableQuantity = fruitInventory[fruit], requiredQuantity <= availableQuantity else {
                return false
            }
        }
        return false
    }
    
    func makeJuice(juiceRecipe: JuiceRecipe) throws  -> String {
        var  ingredients = juiceRecipe.ingredients
        for (fruit, juiceIngrediant) in ingredients {
            guard let ingrediantsInInventory = fruitInventory[fruit], ingrediantsInInventory > juiceIngrediant else {
                throw fruitStoreError.makeJuiceError
            }
            fruitInventory[fruit] = ingrediantsInInventory - juiceIngrediant
        }
        return ("\(juiceRecipe.name)제조완료.")
    }
}
