//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

final class FruitStore {
    private(set) var inventory = Fruit.allCases.reduce([Fruit: Int]()) { bag, fruit in
        var bag = bag
        let initialNumberOfFruits = 10
        bag[fruit] = initialNumberOfFruits
        return bag
    }
    
    func changeAmount(_ fruit: Fruit, _ number: Int) {
        inventory[fruit] = number
    }
    
    private func sendNotification(about fruit: Fruit, number: Int) {
        NotificationCenter.default.post(name: Notification.Name("fruitsAmountDidChange"), object: nil, userInfo: [fruit: number])
    }
    
    private func decreaseStock(of fruit: Fruit, by number: Int, from numberOfFruitExist: Int) {
        let valueAfterChange = numberOfFruitExist - number
        inventory[fruit] = valueAfterChange
        sendNotification(about: fruit, number: valueAfterChange)
    }
    
    private func useIngredients(accordingTo recipes: [(requiredFruit: Fruit, requestedAmount: Int)], checkAmountOfFruits: [Int]) {
        for (index, fruitAmount) in checkAmountOfFruits.enumerated() {
            decreaseStock(of: recipes[index].requiredFruit, by: recipes[index].requestedAmount, from: fruitAmount)
        }
    }
    
    private func checkStock(amountOfFruitNow: Int, requiredAmount: Int) throws {
        guard amountOfFruitNow >= requiredAmount else {
            throw InventoryError.outOfStock(description: InventoryError.outOfStockMessage)
        }
    }
    
    private func getNumberIfExist(_ fruit: Fruit) throws -> Int {
        guard let numberOfFruitExist = inventory[fruit] else {
            throw InventoryError.notExist(description: InventoryError.notExistMessage)
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
        let amountOfFruit = try checkIngredients(recipes)
        
        useIngredients(accordingTo: recipes, checkAmountOfFruits: amountOfFruit)
    }
    
}
