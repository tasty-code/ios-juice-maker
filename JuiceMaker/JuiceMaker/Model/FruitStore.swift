//
//  JuiceMaker - FruitStore.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class FruitStore {
    static let shared = FruitStore()
    
    private(set) var fruitCountList: [FruitType: Int] = [:]
    
    private init(count: Int) {
        for type in FruitType.allCases {
            fruitCountList[type] = count
        }
    }
    
    private init(strawberry: Int, banana: Int, pineapple: Int, mango: Int, kiwi: Int) {
        fruitCountList[.strawberry] = strawberry
        fruitCountList[.banana] = banana
        fruitCountList[.pineapple] = pineapple
        fruitCountList[.mango] = mango
        fruitCountList[.kiwi] = kiwi
    }
    
    convenience init() {
        self.init(count: 10)
    }
    
    func update(fruits: [Fruit], as `operator`: ((Int, Int) -> Int)) throws {
        let calculatedFruits = try getCalculatedCounts(of: fruits, as: `operator`)
        
        for fruit in calculatedFruits {
            applyCount(of: fruit)
        }
    }
    
    func update(_ fruit: Fruit, as `operator`: ((Int, Int) -> Int)) throws {
        guard let fruitCount = fruitCountList[fruit.fruitType] else {
            throw JuiceMakerException.fruitNotFoundError
        }
        fruitCountList[fruit.fruitType] = try getCalculatedCount(of: `operator`(fruitCount, fruit.count))
    }
    
    private func applyCount(of fruit: Fruit) {
        fruitCountList[fruit.fruitType] = fruit.count
    }
    
    private func getCalculatedCounts(of fruits: [Fruit], as `operator`: ((Int, Int) -> Int)) throws -> [Fruit] {
        var checkedFruits = [Fruit]()
        for (fruitType, count) in fruits {
            guard let fruitCount = fruitCountList[fruitType] else {
                throw JuiceMakerException.fruitNotFoundError
            }
            let checkedCount = try getCalculatedCount(of: `operator`(fruitCount, count))
            checkedFruits.append(Fruit(fruitType, checkedCount))
        }
        return checkedFruits
    }
    
    private func getCalculatedCount(of fruitCount: Int) throws -> Int {
        if fruitCount < 0 {
            throw JuiceMakerException.negativeCountError
        }
        return fruitCount
    }
}
