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
    
    private func displayCurrentyFruitInventory(fruit: String, quantity: Int) {
        guard let currentQuantity = fruitInventory[fruit] else {
            print("해당 과일의 재고가 없습니다.")
            return
        }
        let updatedQuantity = currentQuantity
        fruitInventory[fruit] = updatedQuantity
        print("재고변경.\(fruit): \(updatedQuantity)")
    }
    
    func updateFruitQuantity(fruit: String, quantity: Int) {
        if let currentQuantity = fruitInventory[fruit] {
            fruitInventory[fruit] = max(0,currentQuantity + quantity)
        }
        displayCurrentyFruitInventory(fruit: fruit, quantity: quantity)
    }
    
    func checkAvailability(for juiceIngredients: [String: Int]) -> Bool {
        for (fruit, requiredQuantity) in juiceIngredients {
            guard let availableQuantity = fruitInventory[fruit], requiredQuantity <= availableQuantity else {
                return false
            }
        }
        return false
    }
    
    func makeJuice(type: JuiceRecipe) -> String {
        var ingredients = type.ingredients
        for (fruit, quantity) in ingredients {
            guard let available = fruitInventory[fruit], available >= quantity else {
                return "재료가 부족하여 \(type.name)를 제조할 수 없습니다."
            }
        }
        for (fruit, quantity) in ingredients {
            if let available = fruitInventory[fruit], let currentQuantity = fruitInventory[fruit], available >= quantity {
                fruitInventory[fruit] = currentQuantity - quantity
            }
        }
        return "\(type.name)가 제조되었습니다."
    }
}
