//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class FruitStore {
    enum InventoryError : Error {
            static let outOfStockMessage = "재료 없음. 재고를 수정할까요?"
            static let fruitThatDoesNotExistMessage  = "그런 과일 없음"
        
            case inventoryError(description: String)
        }

    private(set) var inventory = Fruit.allCases.reduce([Fruit: Int]()) { bag, fruit in
        var bag = bag
        let initialNumberOfFruits = 10
        bag[fruit] = initialNumberOfFruits
        return bag
    }

    func changeAmount(_ fruit: Fruit, _ number: Int) {
        inventory[fruit] = number
    }
    
    func increaseStock() {
        
    }
    
    func decreaseStock() {
        
    }
    
    func useIngredients() {
        decreaseStock()
    }
    
    func checkStock(amountOfFruitNow: Int, amountRequired: Int) throws {
        guard amountOfFruitNow > amountRequired else {
            throw InventoryError.inventoryError(description: InventoryError.outOfStockMessage)
        }
    }
    
    func giveBackNumberIfExist(_ fruit: Fruit) throws -> Int {
        guard let numberOfFruitExist = inventory[fruit] else {
            throw InventoryError.inventoryError(description: InventoryError.fruitThatDoesNotExistMessage)
        }
        return numberOfFruitExist
    }
    
    func checkIngredients(_ recipes: [(requiredFruit: Fruit, requestedAmount: Int)]) throws -> [Int] {
        var numberOfFruitExist = [Int]()
        
        for demand in recipes {
            let numberOfFruit = try giveBackNumberIfExist(demand.requiredFruit)
            try checkStock(amountOfFruitNow: numberOfFruit, amountRequired: demand.requestedAmount)
            numberOfFruitExist.append(numberOfFruit)
        }

        return numberOfFruitExist
    }
    
    func consumeStocks(_ recipes: [(requiredFruit: Fruit, requestedAmount: Int)]) throws {
        let amountOfFruit = try checkIngredients(recipes)
        
        useIngredients()
    }
    
}
