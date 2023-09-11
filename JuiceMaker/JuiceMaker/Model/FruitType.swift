//
//  FruitType.swift
//  JuiceMaker
//
//  Created by 김준성 on 2023/09/11.
//

import Foundation

typealias Fruit = (fruitType: FruitType, count: UInt)

enum FruitType {
    case strawberry
    case banana
    case pineapple
    case mango
    case kiwi
}
