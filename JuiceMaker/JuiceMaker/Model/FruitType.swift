//
//  FruitType.swift
//  JuiceMaker
//
//  Created by 김준성 on 2023/09/11.
//

import Foundation

typealias Fruit = (fruitType: FruitType, count: Int)

enum FruitType: Int, CaseIterable {
    case strawberry = 0
    case banana = 1
    case pineapple = 2
    case kiwi = 3
    case mango = 4
}
