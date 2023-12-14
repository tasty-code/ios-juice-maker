//
//  JuiceMaker - FruitStore.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    
    var fruitInventory: [String: Int]
    weak var delegate: QuantityVCDelegate?
    
    init () {
        fruitInventory =  [
            "딸기": 10,
            "바나나": 10,
            "파인애플": 10,
            "키위": 10,
            "망고": 10
        ]
    }
    
    func displayCurrentFruitInventory(fruit: String) -> Int? {
        guard let currentQuantity = fruitInventory[fruit] else {
            print("과일저장오류")
            return nil
        }
        return currentQuantity
    }
    
    func updateFruitQuantity(fruit: String, quantity: Int) throws {
        guard var currentQuantity = fruitInventory[fruit] else {
            throw fruitStoreError.currentQuantityError
        }
        currentQuantity = quantity
        if currentQuantity <= 0 {
            throw fruitStoreError.errorDefault
        }
        fruitInventory[fruit] = currentQuantity
    }
    
    func makeJuice(juiceRecipe: JuiceRecipe) throws  -> String {
        let  ingredients = juiceRecipe.ingredients
        for (fruit, juiceIngrediant) in ingredients {
            guard let ingrediantsInInventory = fruitInventory[fruit], ingrediantsInInventory >= juiceIngrediant else {
                throw fruitStoreError.makeJuiceError
            }
            fruitInventory[fruit] = ingrediantsInInventory - juiceIngrediant
        }
        return ("\(juiceRecipe.name)쥬스 나왔습니다! 맛있게 드세요!")
    }
}

