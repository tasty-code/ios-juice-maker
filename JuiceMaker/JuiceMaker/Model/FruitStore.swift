//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    private var eachFruits: Dictionary<Fruits, EachFruitStore>
    
    init() {
        let newFruits: Dictionary<Fruits, EachFruitStore> = Fruits.allCases.reduce(into: [:]) { (result, fruit) in
            let stock = EachFruitStore(fruitType: fruit)
            result.updateValue(stock, forKey: fruit)
        }
        self.eachFruits = newFruits
    }
    
    func get(_ fruit: Fruits, count: Int) throws {
        guard let targetFruitStore = eachFruits[fruit] else { return }
        try targetFruitStore.takeFruits(count: count)
    }
}
