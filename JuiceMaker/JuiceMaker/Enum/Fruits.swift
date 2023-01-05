//
//  Fruits.swift
//  JuiceMaker
//
//  Created by 김보미 on 2023/01/03.
//

import Foundation

enum Fruits: CaseIterable {
    case strawberry
    case banana
    case kiwi
    case pineapple
    case mango
    
    static func makeFruitArray() -> [Fruits:Fruit] {
        var initializedFruitArray = [Fruits:Fruit]()
        Fruits.allCases.forEach {
            initializedFruitArray[$0] = Fruit(name: $0, stock: 10)
        }
        return initializedFruitArray
    }
}
