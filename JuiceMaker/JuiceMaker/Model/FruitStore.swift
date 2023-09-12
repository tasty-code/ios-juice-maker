//
//  JuiceMaker - FruitStore.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    private var strawberry: Int
    private var banana: Int
    private var pineapple: Int
    private var mango: Int
    private var kiwi: Int
    
    init(strawberry: Int, banana: Int, pineapple: Int, mango: Int, kiwi: Int) {
        self.strawberry = strawberry
        self.banana = banana
        self.pineapple = pineapple
        self.mango = mango
        self.kiwi = kiwi
    }
    
    convenience init(count: Int) {
        self.init(strawberry: count, banana: count, pineapple: count, mango: count, kiwi: count)
    }
    
    convenience init() {
        self.init(count: 10)
    }
    
    func update(fruits: [Fruit], as `operator`: ((Int, Int) -> Int)) throws {
        let checkedFruits = try checkValidation(fruits: fruits, as: `operator`)
        
        for fruit in checkedFruits {
            checkedUpdate(fruit)
        }
    }
    
    func update(_ fruit: Fruit, as `operator`: ((Int, Int) -> Int)) throws {
        switch fruit.fruitType {
        case .strawberry:
            strawberry = try checkValidation(fruitCount: `operator`(strawberry, fruit.count))
        case .banana:
            banana = try checkValidation(fruitCount: `operator`(banana, fruit.count))
        case .pineapple:
            pineapple = try checkValidation(fruitCount: `operator`(pineapple, fruit.count))
        case .mango:
            mango = try checkValidation(fruitCount: `operator`(mango, fruit.count))
        case .kiwi:
            kiwi = try checkValidation(fruitCount: `operator`(kiwi, fruit.count))
        }
    }
    
    private func checkedUpdate(_ checkedFruit: Fruit) {
        switch checkedFruit.fruitType {
        case .strawberry:
            strawberry = checkedFruit.count
        case .banana:
            banana = checkedFruit.count
        case .pineapple:
            pineapple = checkedFruit.count
        case .mango:
            mango = checkedFruit.count
        case .kiwi:
            kiwi = checkedFruit.count
        }
    }
    
    private func checkValidation(fruits: [Fruit], as `operator`: ((Int, Int) -> Int)) throws -> [Fruit] {
        var checkedFruits = [Fruit]()
        for (fruitType, count) in fruits {
            var checkedCount = 0
            switch fruitType {
            case .strawberry:
                checkedCount = try checkValidation(fruitCount: `operator`(strawberry, count))
            case .banana:
                checkedCount = try checkValidation(fruitCount: `operator`(banana, count))
            case .pineapple:
                checkedCount = try checkValidation(fruitCount: `operator`(pineapple, count))
            case .mango:
                checkedCount = try checkValidation(fruitCount: `operator`(mango, count))
            case .kiwi:
                checkedCount = try checkValidation(fruitCount: `operator`(kiwi, count))
            }
            checkedFruits.append(Fruit(fruitType, checkedCount))
        }
        return checkedFruits
    }
    
    private func checkValidation(fruitCount: Int) throws -> Int {
        if fruitCount < 0 {
            throw JuiceMakerException.negativeCountError
        }
        return fruitCount
    }
}
