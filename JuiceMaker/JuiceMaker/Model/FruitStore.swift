//
//  JuiceMaker - FruitStore.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    static let shared = FruitStore()
    
    private(set) var strawberry: Int
    private(set) var banana: Int
    private(set) var pineapple: Int
    private(set) var mango: Int
    private(set) var kiwi: Int
    
    private init(strawberry: Int, banana: Int, pineapple: Int, mango: Int, kiwi: Int) {
        self.strawberry = strawberry
        self.banana = banana
        self.pineapple = pineapple
        self.mango = mango
        self.kiwi = kiwi
    }
    
    private convenience init(count: Int) {
        self.init(strawberry: count, banana: count, pineapple: count, mango: count, kiwi: count)
    }
    
    private convenience init() {
        self.init(count: 10)
    }
    
    func update(fruits: [Fruit], as `operator`: ((Int, Int) -> Int)) throws {
        let calculatedFruits = try getCalculatedCounts(of: fruits, as: `operator`)
        
        for fruit in calculatedFruits {
            applyCount(of: fruit)
        }
    }
    
    func update(_ fruit: Fruit, as `operator`: ((Int, Int) -> Int)) throws {
        switch fruit.fruitType {
        case .strawberry:
            strawberry = try getCalculatedCount(of: `operator`(strawberry, fruit.count))
        case .banana:
            banana = try getCalculatedCount(of: `operator`(banana, fruit.count))
        case .pineapple:
            pineapple = try getCalculatedCount(of: `operator`(pineapple, fruit.count))
        case .mango:
            mango = try getCalculatedCount(of: `operator`(mango, fruit.count))
        case .kiwi:
            kiwi = try getCalculatedCount(of: `operator`(kiwi, fruit.count))
        }
    }
    
    private func applyCount(of fruit: Fruit) {
        switch fruit.fruitType {
        case .strawberry:
            strawberry = fruit.count
        case .banana:
            banana = fruit.count
        case .pineapple:
            pineapple = fruit.count
        case .mango:
            mango = fruit.count
        case .kiwi:
            kiwi = fruit.count
        }
    }
    
    private func getCalculatedCounts(of fruits: [Fruit], as `operator`: ((Int, Int) -> Int)) throws -> [Fruit] {
        var checkedFruits = [Fruit]()
        for (fruitType, count) in fruits {
            var checkedCount = 0
            switch fruitType {
            case .strawberry:
                checkedCount = try getCalculatedCount(of: `operator`(strawberry, count))
            case .banana:
                checkedCount = try getCalculatedCount(of: `operator`(banana, count))
            case .pineapple:
                checkedCount = try getCalculatedCount(of: `operator`(pineapple, count))
            case .mango:
                checkedCount = try getCalculatedCount(of: `operator`(mango, count))
            case .kiwi:
                checkedCount = try getCalculatedCount(of: `operator`(kiwi, count))
            }
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
