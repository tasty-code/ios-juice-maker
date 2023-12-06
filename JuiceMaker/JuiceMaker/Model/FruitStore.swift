//
//  JuiceMaker - FruitStore.swift
//  Created by Kyle& L
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

final class FruitStore {
    var strawberryStock: Int
    var bananaStock: Int
    var pineappleStock: Int
    var kiwiStock: Int
    var mangoStock: Int
    
    init(strawberryStock: Int, bananaStock: Int, pineappleStock: Int, kiwiStock: Int, mangoStock: Int) {
        self.strawberryStock = strawberryStock
        self.bananaStock = bananaStock
        self.pineappleStock = pineappleStock
        self.kiwiStock = kiwiStock
        self.mangoStock = mangoStock
    }
    
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
