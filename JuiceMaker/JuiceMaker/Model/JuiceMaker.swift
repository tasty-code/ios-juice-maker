//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker: Makeable {
    let fruitStore = FruitStore.shared
    
    let calculator: Computable
    
    init(calculator: Computable) {
        self.calculator = calculator
    }
    
    func requestTo(strawberry juice: FruitList, number: Int) {
        guard let currentStock = fruitStore.store[.strawberry] else{
            return
        }
        if juice == FruitList.strawberry {
            let calculationResult = calculator.subtract(number1: currentStock, number2: number)
            guard calculationResult >= 0 else{
                return
            }
            fruitStore.store.updateValue(calculator.subtract(number1: calculationResult, number2: number), forKey: .strawberry)
        }
    }
    
    func requestTo(banana juice: FruitList, number: Int) {
        fruitStore.store.updateValue(number, forKey: juice)
    }
    
    func requestTo(kiwi juice: FruitList, number: Int) {
        fruitStore.store.updateValue(number, forKey: juice)
    }
    
    func requestTo(pineApple juice: FruitList, number: Int) {
        fruitStore.store.updateValue(number, forKey: juice)
    }
    
    func requestTo(mango juice: FruitList, number: Int) {
        fruitStore.store.updateValue(number, forKey: juice)
    }
    
    func requestTo(mixed juice: (FruitList, FruitList), numbers: (Int, Int)) -> Int {
        fruitStore.store.updateValue(numbers.0, forKey: juice.0)
        fruitStore.store.updateValue(numbers.1, forKey: juice.1)
        
        return 0
    }
}
