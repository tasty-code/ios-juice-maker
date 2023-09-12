//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

final class FruitStore {
    
    // MARK: - Properties
    
    var fruitNames: [FruitJuice] = [.strawberry, .banana, .pineapple, .kiwi, .mango]
    var fruitDictionary: [FruitJuice: Int] = [:]
    
    // MARK: - Methods
    
    func fetchFruitStock() {
        for name in fruitNames {
            fruitDictionary[name] = 10
        }
    }
    
    func makeJuice(of name: FruitJuice) {
        switch name {
        case .strawberry:
            fruitDictionary[name, default: .defaultStock] -= 13
        case .banana:
            fruitDictionary[name, default: .defaultStock] -= 2
        case .pineapple:
            fruitDictionary[name, default: .defaultStock] -= 2
        case .kiwi:
            fruitDictionary[name, default: .defaultStock] -= 3
        case .mango:
            fruitDictionary[name, default: .defaultStock] -= 3
        case .strawberryBanana:
            fruitDictionary[.strawberry, default: .defaultStock] -= 10
            fruitDictionary[.banana, default: .defaultStock] -= 1
        case .mangoKiwi:
            fruitDictionary[.mango, default: .defaultStock] -= 2
            fruitDictionary[.kiwi, default: .defaultStock] -= 1
        }
    }
}

