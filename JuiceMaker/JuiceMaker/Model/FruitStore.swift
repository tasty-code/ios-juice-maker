//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    private var eachFruits: Set<EachFruitStore>
    
    init() {
        let newFruits = Fruits.allCases.map { fruit in
            EachFruitStore(fruitType: fruit)
        }
        self.eachFruits = Set(newFruits)
    }
    
    private func findFruits(_ fruit: Fruits) -> EachFruitStore? {
        return eachFruits.first(where: { eachFruitStore in
            eachFruitStore.fruitType == fruit
        })
    }
    
    func get(_ fruit: Fruits, count: Int) throws {
        guard let targetFruitStore = findFruits(fruit) else { return }
        try targetFruitStore.takeFruits(count: count)
    }
}
