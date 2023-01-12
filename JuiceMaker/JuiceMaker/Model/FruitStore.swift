//
//  JuiceMaker - FruitStore.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
final class FruitStore {
    private(set) var stockByFruit = [Fruit: UInt]()

    enum Fruit: CaseIterable {
        case strawberry, banana, pineapple, kiwi, mango

        var sequence: Int {
            switch self {
            case .strawberry:
                return 0
            case .banana:
                return 1
            case .pineapple:
                return 2
            case .kiwi:
                return 3
            case .mango:
                return 4
            }
        }
    }

    init(stock: UInt = 10) {
        for fruit in Fruit.allCases {
            stockByFruit[fruit] = stock
        }
    }

    func subtractStock(fruit: Fruit, count: UInt) throws {
        let fruitStock = stock(byFruit: fruit)
        guard fruitStock >= count else {
            throw JuiceMakerError.outOfStock
        }
        stockByFruit[fruit] = fruitStock - count
    }

    func addStock(fruit: Fruit, count: UInt) throws {
        self.stockByFruit[fruit] = stock(byFruit: fruit) + count
    }
    
    func stock(byFruit: Fruit) -> UInt {
        return stockByFruit[byFruit] ?? 0
    }

    func hasEnoughStock(recipe: [Fruit: UInt]) -> Bool {
        let notEnoughStock = recipe.filter { (fruit, count) in
            count > stock(byFruit: fruit)
        }
        return notEnoughStock.isEmpty
    }
}
