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
    
    func startMake(single juice: FruitSingleJuice) {
        switch juice {
        case .strawberry:
            requestTo(single: .strawberry)
            break
        case .banana:
            requestTo(single: .banana)
            break
        case .kiwi:
            requestTo(single: .kiwi)
            break
        case .pineApple:
            requestTo(single: .pineApple)
            break
        case .mango:
            requestTo(single: .mango)
            break
        }
    }
    
    func startMake(mix juice: FruitMixJuice) {
        switch juice {
        case .strawberryAndBanana:
            requestTo(mix: .strawberryAndBanana)
            break
        case .mangoAndKiwi:
            requestTo(mix: .mangoAndKiwi)
            break
        }
    }
    
    func requestTo(single juice: FruitSingleJuice) {
        juice.recipe.forEach { (key: FruitList, value: Int) in
            guard let storeOfFruitCount = fruitStore.storeValue(fruit: key) else {
                return
            }
            
            var remainFruitCount = calculator.subtract(number1: storeOfFruitCount, number2: value)
            if remainFruitCount < 0 {
                remainFruitCount = storeOfFruitCount
            }
            
            let determine = fruitStore.isPossibleMakeSingle(juice: key, stockNumber: storeOfFruitCount)
            fruitStore.store.updateValue(remainFruitCount, forKey: key)
            
            guard calculator.compare(type: key, isRemainCount: determine) == true else {
                return
            }
        }
    }
    
    func requestTo(mix juice: FruitMixJuice) {
        <#code#>
    }
    
    func currentNumber(fruit juice: FruitMixJuice) -> ([Int], [Int]) {
        var storeItem = [Int]()
        var needItem = [Int]()
        
        for _ in 0..<juice.recipe.count {
            juice.recipe.forEach { (key: FruitList, value: Int) in
                var temp: Int?
                var temp2: Int?
                
                switch key {
                case .strawberry:
                    temp = fruitStore.storeValue(fruit: .strawberry)
                    temp2 = juice.recipe[.strawberry]
                case .banana:
                    temp = fruitStore.storeValue(fruit: .banana)
                    temp2 = juice.recipe[.banana]
                case .kiwi:
                    temp = fruitStore.storeValue(fruit: .kiwi)
                    temp2 = juice.recipe[.kiwi]
                case .pineApple:
                    temp = fruitStore.storeValue(fruit: .pineApple)
                    temp2 = juice.recipe[.pineApple]
                case .mango:
                    temp = fruitStore.storeValue(fruit: .mango)
                    temp2 = juice.recipe[.mango]
                }
                guard let storeFruitNumber = temp else {
                    return
                }
                guard let needFruitNumber = temp2 else {
                    return
                }
                storeItem.append(storeFruitNumber)
                needItem.append(needFruitNumber)
            }
            break
        }
        return (storeItem, needItem)
    }
}
