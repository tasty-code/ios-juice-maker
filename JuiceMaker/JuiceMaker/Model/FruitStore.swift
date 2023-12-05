//
//  JuiceMaker - FruitStore.swift
//  Created by Kyle& L
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class FruitStore {
    var strawberryStock: Int = 10
    var bananaStock: Int = 10
    var pineappleStock: Int = 10
    var kiwiStock: Int = 10
    var mangoStock: Int = 10
    
    func manageFruitsStocks(_ fruit: Fruits, count: Int) {
        switch fruit {
        case .strawberry:
            self.strawberryStock = count
        case .banana:
            self.bananaStock = count
        case .pineapple:
            self.pineappleStock = count
        case .kiwi:
            self.kiwiStock = count
        case .mango:
            self.mangoStock = count
        }
    }

    func useJuiceIngredient(_ fruit: Fruits, count: Int) {
        switch fruit {
        case .strawberry:
            self.strawberryStock -= count
        case .banana:
            self.bananaStock -= count
        case .pineapple:
            self.pineappleStock -= count
        case .kiwi:
            self.kiwiStock -= count
        case .mango:
            self.mangoStock -= count
        }
    }
}
