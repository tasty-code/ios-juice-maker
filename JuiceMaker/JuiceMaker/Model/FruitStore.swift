//
//  JuiceMaker - FruitStore.swift
//  Created by Kyle & L
//  Copyright © yagom academy. All rights reserved.
//

final class FruitStore {
    var fruitStocks: [Fruits:Int]
    
    init(strawberryStock: Int, bananaStock: Int, pineappleStock: Int, kiwiStock: Int, mangoStock: Int) {
        fruitStocks = [
            .strawberry: strawberryStock,
            .banana: bananaStock,
            .pineapple: pineappleStock,
            .kiwi: kiwiStock,
            .mango: mangoStock
        ]
    }
    
    func manageFruitsStocks(_ fruit: Fruits, count: Int) {
        fruitStocks[fruit] = count
    }
    
    func hasEnoughStock(fruit: Fruits, count: Int) -> Bool {
        guard
            let stock = fruitStocks[fruit]
        else {
            return false
        }
        return stock >= count
    }
    
    func useJuiceIngredient(_ fruit: Fruits, count: Int) {
        guard 
            let stock = fruitStocks[fruit]
        else {
            return
        }
        fruitStocks[fruit] = stock - count
    }
    
}
