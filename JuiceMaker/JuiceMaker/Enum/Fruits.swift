//
//  Fruits.swift
//  JuiceMaker
//
//  Created by 김보미 on 2023/01/03.
//

import Foundation

enum Fruits: String, CaseIterable {
    case strawberry = "Sb"
    case banana = "Bn"
    case kiwi = "Kw"
    case pineapple = "Pa"
    case mango = "Mg"
    
    static func makeFruitArray() -> [String:Fruit] {
        var initializedFruitArray = [String:Fruit]()
        Fruits.allCases.forEach {
            initializedFruitArray[$0.rawValue] = Fruit(name: $0.rawValue, amount: 10)
        }
        return initializedFruitArray
    }
}
