//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker: Makeable {
    let fruitStore = FruitStore.shared
    
    func make(single juice: SingleFruitJuice) {
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
    
    func make(mix juice: MixFruitJuice) {
        switch juice {
        case .strawberryAndBanana:
            requestTo(mix: .strawberryAndBanana)
            break
        case .mangoAndKiwi:
            requestTo(mix: .mangoAndKiwi)
            break
        }
    }
    
    private func isMakeable(_ juice: SingleFruitJuice, send consume: Int) -> Bool {
        var isContinue = false
        
        juice.recipe.forEach { fruit in
            isContinue = fruitStore.isRemainFruit(type: fruit.key, count: consume)
            
            if !isContinue {
                print("\(fruit.key) 재고가 없습니다!")
            }
        }
        return isContinue
    }
    
    private func isMakeable(_ juice: MixFruitJuice, send consumes: [Int]) -> Bool {
        var isContinue = false
        var needCounts = consumes
        
        juice.recipe.forEach { fruit in
            guard let extractCount = needCounts.first else {
                return
            }
            let discern = fruitStore.isRemainFruit(type: fruit.key, count: extractCount)
            isContinue = discern
            
            if !isContinue {
                print("\(fruit.key) 재고가 없습니다!")
            }
            needCounts.removeFirst()
        }
        return isContinue
    }
    
    func requestTo(single juice: SingleFruitJuice) {
        juice.recipe.forEach { (key: Fruit, value: Int) in
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
    
    func requestTo(mix juice: MixFruitJuice) {
        var allOfMixJuiceCount = ([Int](), [Int]())
        var firstFruitStoreDetermine = false
        var secondFruitStoreDetermine = false
        
        juice.caseList.forEach { key in
            if key == juice {
                allOfMixJuiceCount = currentNumber(fruit: key)
                let currentMixJuiceCount = allOfMixJuiceCount.0
                let needMixJuiceCount = allOfMixJuiceCount.1
                
                var firstMixJuiceRemainCount = calculator.subtract(number1: currentMixJuiceCount[0], number2: needMixJuiceCount[0])
                var secondMixJuiceRemainCount = calculator.subtract(number1: currentMixJuiceCount[1], number2: needMixJuiceCount[1])
                if firstMixJuiceRemainCount < 0 || secondMixJuiceRemainCount < 0 {
                    firstMixJuiceRemainCount = currentMixJuiceCount[0]
                    secondMixJuiceRemainCount = currentMixJuiceCount[1]
                }
                
                let determine = fruitStore.isPossibleMakeMix(juice: key, stockNumber: (currentMixJuiceCount[0], currentMixJuiceCount[1]))
                
                juice.recipe.forEach { (key: FruitList, value: Int) in
                    switch key {
                    case .strawberry:
                        firstFruitStoreDetermine = calculator.compare(type: .strawberry, isRemainCount: determine)
                        fruitStore.store.updateValue(firstMixJuiceRemainCount, forKey: .strawberry)
                    case .banana:
                        secondFruitStoreDetermine = calculator.compare(type: .banana, isRemainCount: determine)
                        fruitStore.store.updateValue(secondMixJuiceRemainCount, forKey: .banana)
                    case .kiwi:
                        secondFruitStoreDetermine = calculator.compare(type: .kiwi, isRemainCount: determine)
                        fruitStore.store.updateValue(secondMixJuiceRemainCount, forKey: .kiwi)
                    case .pineApple:
                        return
                    case .mango:
                        firstFruitStoreDetermine = calculator.compare(type: .mango, isRemainCount: determine)
                        fruitStore.store.updateValue(firstMixJuiceRemainCount, forKey: .mango)
                    }
                }
                guard firstFruitStoreDetermine == true || secondFruitStoreDetermine == true else {
                    return
                }
            }
        }
    } 
    
    func currentNumber(fruit juice: MixFruitJuice) -> ([Int], [Int]) {
        var storeItemsCount = [Int]()
        var consumeItemsCount = [Int]()
        
        for _ in 0..<juice.recipe.count {
            juice.recipe.forEach { (key: Fruit, value: Int) in
                var storeItem: Int?
                var consumeItem: Int?
                
                switch key {
                case .strawberry:
                    storeItem = fruitStore.storeValue(fruit: .strawberry)
                    consumeItem = juice.recipe[.strawberry]
                case .banana:
                    storeItem = fruitStore.storeValue(fruit: .banana)
                    consumeItem = juice.recipe[.banana]
                case .kiwi:
                    storeItem = fruitStore.storeValue(fruit: .kiwi)
                    consumeItem = juice.recipe[.kiwi]
                case .pineApple:
                    storeItem = fruitStore.storeValue(fruit: .pineApple)
                    consumeItem = juice.recipe[.pineApple]
                case .mango:
                    storeItem = fruitStore.storeValue(fruit: .mango)
                    consumeItem = juice.recipe[.mango]
                }
                guard let storeFruitNumber = storeItem else {
                    return
                }
                guard let needFruitNumber = consumeItem else {
                    return
                }
                storeItemsCount.append(storeFruitNumber)
                consumeItemsCount.append(needFruitNumber)
            }
            break
        }
        return (storeItemsCount, consumeItemsCount)
    }
}
