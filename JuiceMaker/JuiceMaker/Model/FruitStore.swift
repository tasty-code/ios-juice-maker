//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    private var fruit: [Fruit: Int] = [.strawberry : 10, .banana : 10, .pineapple : 10, .kiwi : 10, .mango : 10]
    
    enum Fruit: String {
        case strawberry = "딸기"
        case banana = "바나나"
        case pineapple = "파인애플"
        case kiwi = "키위"
        case mango = "망고"
    }
    
    func makeJuice(_ ingredient: [Fruit], _ recipe: [Int?]) throws -> Bool {
        if recipe.filter({ $0 == nil }).count == 2 {
            throw ErrorMessage.stockInsufficients([ingredient[0].rawValue, ingredient[1].rawValue])
        }
        if let nilIndex = recipe.firstIndex(of: nil) {
            throw ErrorMessage.stockInsufficient(ingredient[nilIndex].rawValue)
        }
        let nonOptionalRecipe = recipe.compactMap { $0 }
        
        return calculateStock(ingredient, nonOptionalRecipe) ? true : false
    }
    
    func getStockInfo(_ fruit: [Fruit]) throws -> [Int] {
        guard let firstFruit = self.fruit[fruit[0]] else {
            throw ErrorMessage.invalidInput
        }
        if fruit.count > 1 {
            guard let secondFruit = self.fruit[fruit[1]] else {
                throw ErrorMessage.invalidInput
            }
            return [firstFruit, secondFruit]
        }
        return [firstFruit]
    }
    
    private func calculateStock(_ ingredient: [Fruit], _ recipe: [Int]) -> Bool {
        for count in 0..<ingredient.count {
            guard let currentFruitStock = self.fruit[ingredient[count]] else {
                return false
            }
            self.fruit.updateValue(currentFruitStock - recipe[count], forKey: ingredient[count])
        }
        return true
    }
}
