//
//  Makeable.swift
//  JuiceMaker
//
//  Created by Jason on 2023/01/04.
//

import Foundation

protocol Makeable {
    func requestTo(strawberry juice: FruitList, number: Int)
    func requestTo(banana juice: FruitList, number: Int)
    func requestTo(kiwi juice: FruitList, number: Int)
    func requestTo(pineApple juice: FruitList, number: Int)
    func requestTo(mango juice: FruitList, number: Int)
    func requestTo(mixed juice: (FruitList, FruitList), numbers: (Int, Int)) -> Int
}
