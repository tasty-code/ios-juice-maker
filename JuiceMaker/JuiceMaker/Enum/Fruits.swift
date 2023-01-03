//
//  Fruits.swift
//  JuiceMaker
//
//  Created by 김보미 on 2023/01/03.
//

import Foundation

enum Fruits: String, CaseIterable {
    case strawberry
    case banana
    case kiwi
    case pineapple
    case mango
    
    static func makeFruitArray() -> [Fruit] {
        let initializedFruitArray = Fruits.allCases.map {
            Fruit(name: $0.rawValue, amount: 10)
        }
        return initializedFruitArray
    }
}
