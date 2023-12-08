//
//  JuiceMaker - FruitStore.swift
//  Created by Kyle& L
//  Copyright © yagom academy. All rights reserved.
//

final class FruitStore {

    var fruitStock: [Fruits:Int]
        
    init(strawberry: Int, banana: Int, pineapple: Int, kiwi: Int, mango: Int) {
        fruitStock = [
            .strawberry:strawberry,
            .banana:banana,
            .pineapple:pineapple,
            .kiwi:kiwi,
            .mango:mango
        ]
    }
    
    func manageFruitsStocks(fruit: Fruits, count: Int) {
        guard let name = fruitStock[fruit]  else { return }
        fruitStock[fruit] = count
    }
    
    func useJuiceIngredient(fruit: Fruits, count: Int) {
        guard let name = fruitStock[fruit]  else { return }
        fruitStock[fruit] = name - count
        
    }
    
}
