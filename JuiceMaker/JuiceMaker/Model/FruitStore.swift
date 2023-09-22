//
//  JuiceMaker - FruitStore.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class FruitStore {
    static let shared = FruitStore()
    
    private(set) var fruitCounts: [FruitType: Int] = [:]
    
    private init(count: Int) {
        for type in FruitType.allCases {
            fruitCounts[type] = count
        }
    }
    
    private init(strawberry: Int, banana: Int, pineapple: Int, mango: Int, kiwi: Int) {
        fruitCounts[.strawberry] = strawberry
        fruitCounts[.banana] = banana
        fruitCounts[.pineapple] = pineapple
        fruitCounts[.mango] = mango
        fruitCounts[.kiwi] = kiwi
    }
    
    private convenience init() {
        self.init(count: 10)
    }
    
    func update(fruits: [Fruit], as operator: (Int, Int) -> Int) throws {
        let calculatedFruits = try getCalculatedCounts(of: fruits, as: `operator`)
        
        for fruit in calculatedFruits {
            applyCount(of: fruit)
        }
    }
    
    func update(_ fruit: Fruit, as operator: (Int, Int) -> Int) throws {
        guard let fruitCount = fruitCounts[fruit.fruitType] else {
            throw JuiceMakerException.fruitNotFound
        }
        fruitCounts[fruit.fruitType] = try getCalculatedCount(of: `operator`(fruitCount, fruit.count))
    }
    
    private func applyCount(of fruit: Fruit) {
        fruitCounts[fruit.fruitType] = fruit.count
    }
    
    private func getCalculatedCounts(of fruits: [Fruit], as operator: (Int, Int) -> Int) throws -> [Fruit] {
        var checkedFruits = [Fruit]()
        for (fruitType, count) in fruits {
            guard let fruitCount = fruitCounts[fruitType] else {
                throw JuiceMakerException.fruitNotFound
            }
            let calculatedCount = try getCalculatedCount(of: `operator`(fruitCount, count))
            checkedFruits.append(Fruit(fruitType, calculatedCount))
        }
        return checkedFruits
    }
    
    private func getCalculatedCount(of fruitCount: Int) throws -> Int {
        if fruitCount < 0 {
            throw JuiceMakerException.negativeCount
        }
        return fruitCount
    }
}
