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
        var storeItem = ([Int](), [Int]())
        var firstDetermine = false
        var secondDetermine = false
        
        juice.caseList.forEach { key in
            if key == juice {
                storeItem = currentNumber(fruit: key)
                let currentStoreFruitValue = storeItem.0
                let needFruitValue = storeItem.1
                
                var firstMixFruitRemainCount = calculator.subtract(number1: currentStoreFruitValue[0], number2: needFruitValue[0])
                var secondMixFruitRemainCount = calculator.subtract(number1: currentStoreFruitValue[1], number2: needFruitValue[1])
                if firstMixFruitRemainCount < 0 || secondMixFruitRemainCount < 0 {
                    firstMixFruitRemainCount = currentStoreFruitValue[0]
                    secondMixFruitRemainCount = currentStoreFruitValue[1]
                }
                
                let determine = fruitStore.isPossibleMakeMix(juice: key, stockNumber: (currentStoreFruitValue[0], currentStoreFruitValue[1]))
                
                juice.recipe.forEach { (key: FruitList, value: Int) in
                    switch key {
                    case .strawberry:
                        firstDetermine = calculator.compare(type: .strawberry, isRemainCount: determine)
                        fruitStore.store.updateValue(firstMixFruitRemainCount, forKey: .strawberry)
                    case .banana:
                        secondDetermine = calculator.compare(type: .banana, isRemainCount: determine)
                        fruitStore.store.updateValue(secondMixFruitRemainCount, forKey: .banana)
                    case .kiwi:
                        secondDetermine = calculator.compare(type: .kiwi, isRemainCount: determine)
                        fruitStore.store.updateValue(secondMixFruitRemainCount, forKey: .kiwi)
                    case .pineApple:
                        return
                    case .mango:
                        firstDetermine = calculator.compare(type: .mango, isRemainCount: determine)
                        fruitStore.store.updateValue(firstMixFruitRemainCount, forKey: .mango)
                    }
                }
                guard firstDetermine == true || secondDetermine == true else {
                    return
                }
            }
        }
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
