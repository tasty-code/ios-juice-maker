//
//  Fruits.swift
//  JuiceMaker
//
//  Created by 김보미 on 2023/01/03.
//

import Foundation

enum Fruits: Int, CaseIterable {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
}

extension Fruits {
    static func makeFruitArray() -> [Fruits:Fruit] {
        var initializedFruitArray = [Fruits:Fruit]()
        Fruits.allCases.forEach {
            initializedFruitArray[$0] = Fruit(name: $0, stock: 10)
        }
        return initializedFruitArray
    }
}
