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
    
    func updateFruitQuantity(fruit: String, quantity: Int) throws {
        guard var currentQuantity = fruitInventory[fruit] else {
            throw CustomError.fruitUpdateError(message: "과일없음")
        }
        currentQuantity = quantity
        if currentQuantity <= 0 {
            throw CustomError.fruitUpdateError(message: "과일은 0개 이하로 내려갈 수 없습니다")
        }
        fruitInventory[fruit] = currentQuantity
        displayCurrentyFruitInventory(fruit: fruit, quantity: currentQuantity)
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
                throw CustomError.makeJuiceError(message: "not enough ingrediantss in invetory")
            }
            fruitInventory[fruit] = ingrediantsInInventory - juiceIngrediant
            print("\(juiceRecipe.name)제조완료.")
        }
        return "\(CustomError.makeJuiceError(message: "makeJuiceMethodError"))"
    }
    
}
