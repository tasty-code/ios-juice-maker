//
//  JuiceMaker - FruitStore.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    
    var fruitInventory: [String: Int]
    
    weak var delegate: MainViewControllerDelegate?
    
    init (strawberry:Int = 10, banana:Int = 10, pineapple:Int = 10, kiwi:Int = 10, mango:Int = 10 ) {
        fruitInventory = [
            "딸기" : strawberry,
            "바나나" : banana,
            "파인애플" : pineapple,
            "키위" : kiwi,
            "망고" : mango
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
            throw FruitSotoreError.currentQuantityError
        }
        currentQuantity = quantity
        if currentQuantity <= 0 {
            throw FruitSotoreError.errorDefault
        }
        fruitInventory[fruit] = currentQuantity
    }
    
    func makeJuice(juiceRecipe: JuiceRecipe) throws  -> String {
        let  ingredients = juiceRecipe.ingredients
        for (fruit, juiceIngrediant) in ingredients {
            guard let ingrediantsInInventory = fruitInventory[fruit], ingrediantsInInventory >= juiceIngrediant else {
                throw FruitSotoreError.makeJuiceError
            }
            fruitInventory[fruit] = ingrediantsInInventory - juiceIngrediant
        }
        return ("\(juiceRecipe.name)쥬스 나왔습니다! 맛있게 드세요!")
    }
}

