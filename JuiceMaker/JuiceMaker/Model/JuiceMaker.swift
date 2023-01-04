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
        guard let currentStock = fruitStore.store[.strawberry] else {
            return
        }
        
        if juice == FruitList.strawberry {
            let remainStrawberryCount = calculator.subtract(number1: currentStock, number2: number)
            let determine = fruitStore.isPossibleMakeSingle(juice: .strawberry, stockNumber: currentStock)
            
            if determine == true {
                print("딸기 재고 없음...")
                return
            }
            fruitStore.store.updateValue(remainStrawberryCount, forKey: FruitList.strawberry)
        }
    }
    
    func requestTo(banana juice: FruitList, number: Int) {
        guard let currentStock = fruitStore.store[.banana] else {
            return
        }
        
        if juice == FruitList.banana {
            let remainStrawberryCount = calculator.subtract(number1: currentStock, number2: number)
            let determine = fruitStore.isPossibleMakeSingle(juice: .banana, stockNumber: currentStock)
            
            if determine == true {
                print("바나나 재고 없음...")
                return
            }
            fruitStore.store.updateValue(remainStrawberryCount, forKey: FruitList.banana)
        }
    }
    
    func requestTo(kiwi juice: FruitList, number: Int) {
        guard let currentStock = fruitStore.store[.kiwi] else {
            return
        }
        
        if juice == FruitList.kiwi {
            let remainStrawberryCount = calculator.subtract(number1: currentStock, number2: number)
            let determine = fruitStore.isPossibleMakeSingle(juice: .kiwi, stockNumber: currentStock)
            
            if determine == true {
                print("키위 재고 없음...")
                return
            }
            fruitStore.store.updateValue(remainStrawberryCount, forKey: FruitList.kiwi)
        }
    }
    
    func requestTo(pineApple juice: FruitList, number: Int) {
        guard let currentStock = fruitStore.store[.pineApple] else {
            return
        }
        
        if juice == FruitList.pineApple {
            let remainStrawberryCount = calculator.subtract(number1: currentStock, number2: number)
            let determine = fruitStore.isPossibleMakeSingle(juice: .pineApple, stockNumber: currentStock)
            
            if determine == true {
                print("파인애플 재고 없음...")
                return
            }
            fruitStore.store.updateValue(remainStrawberryCount, forKey: FruitList.pineApple)
        }
    }
    
    func requestTo(mango juice: FruitList, number: Int) {
        guard let currentStock = fruitStore.store[.mango] else {
            return
        }
        
        if juice == FruitList.mango {
            let remainStrawberryCount = calculator.subtract(number1: currentStock, number2: number)
            let determine = fruitStore.isPossibleMakeSingle(juice: .mango, stockNumber: currentStock)
            
            if determine == true {
                print("망고 재고 없음...")
                return
            }
            fruitStore.store.updateValue(remainStrawberryCount, forKey: FruitList.mango)
        }
    }
    
    func requestTo(mixed juice: (FruitList, FruitList), numbers: (Int, Int)) -> Int {
        fruitStore.store.updateValue(numbers.0, forKey: juice.0)
        fruitStore.store.updateValue(numbers.1, forKey: juice.1)
        
        return 0
    }
}
