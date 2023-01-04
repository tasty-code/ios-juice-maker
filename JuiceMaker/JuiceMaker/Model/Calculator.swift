//
//  Calculator.swift
//  JuiceMaker
//
//  Created by Jason on 2023/01/04.
//

import Foundation

struct Calculator: Computable {
    func add(number1: Int, number2: Int) -> Int {
        return number1 + number2
    }
    
    func subtract(number1: Int, number2: Int) -> Int {
        return number1 - number2
    }
}
