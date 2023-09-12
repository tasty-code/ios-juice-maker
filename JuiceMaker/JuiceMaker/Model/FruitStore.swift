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
}

