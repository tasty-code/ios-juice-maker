//
//  Computable.swift
//  JuiceMaker
//
//  Created by Jason on 2023/01/04.
//

import Foundation

protocol Computable {
    func add(number1: Int, number2: Int) -> Int
    func subtract(number1: Int, number2: Int) -> Int
    func compare(type: FruitList, isRemainCount: Bool) -> Bool
}
