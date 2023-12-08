//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class FruitStore {
    private(set) var inventory = Fruit.allCases.reduce([Fruit: Int]()) { bag, fruit in
        var bag = bag
        let initialNumberOfFruits = 10
        bag[fruit] = initialNumberOfFruits
        return bag
    }

    func changeAmount(_ fruit: Fruit, _ number: Int) {
        inventory[fruit] = number
    }
    
    private func decreaseStock() {
        
    }
    
    private func useIngredients() {
        decreaseStock()
    }
    
    private func checkStock(amountOfFruitNow: Int, requiredAmount: Int) throws {
        guard amountOfFruitNow > requiredAmount else {
            throw InventoryError.inventoryError(description: InventoryError.outOfStockMessage)
        }
    }
    
    private func getNumberIfExist(_ fruit: Fruit) throws -> Int {
        guard let numberOfFruitExist = inventory[fruit] else {
            throw InventoryError.inventoryError(description: InventoryError.NotExistMessage)
        }
        return numberOfFruitExist
    }
    
    private func checkIngredients(_ recipes: [(requiredFruit: Fruit, requestedAmount: Int)]) throws -> [Int] {
        var numberOfFruitExist = [Int]()
        
        for demand in recipes {
            let numberOfFruit = try getNumberIfExist(demand.requiredFruit)
            try checkStock(amountOfFruitNow: numberOfFruit, requiredAmount: demand.requestedAmount)
            numberOfFruitExist.append(numberOfFruit)
        }

        return numberOfFruitExist
    }
    
    func consumeStocks(_ recipes: [(requiredFruit: Fruit, requestedAmount: Int)]) throws {
        let _ = try checkIngredients(recipes)
        
        useIngredients()
    }
    
}
