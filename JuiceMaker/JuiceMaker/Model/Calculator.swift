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
    
    func compare(type: FruitList, isRemainCount: Bool) -> Bool {
        if isRemainCount == false {
            switch type {
            case .strawberry:
                print(StockError.notEnoughStrawberryStock)
            case .banana:
                print(StockError.notEnoughBananaStock)
            case .kiwi:
                print(StockError.notEnoughKiwiStock)
            case .pineApple:
                print(StockError.notEnoughPineAppleStock)
            case .mango:
                print(StockError.notEnoughMangoStock)
            }
        }
        return isRemainCount
    }
}
