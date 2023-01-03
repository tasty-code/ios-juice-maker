//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum Fruits: CaseIterable {
    case strawberry
    case banana
    case kiwi
    case pineapple
    case mango
}

typealias Quantity = Int

final class FruitStore {
    static let shared = FruitStore()

    var fruitBasket: [Fruits: Quantity] = [:]

    private init() {
        Fruits.allCases.forEach { fruit in
            fruitBasket[fruit] = 10
        }
    }
}
