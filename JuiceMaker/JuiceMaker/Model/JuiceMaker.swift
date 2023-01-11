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
    
    private func blending(juice: SingleFruitJuice) {
        let needToMakeJuiceCount = fruitStore.needCountOfMake(to: juice)
        let isContinue = isMakeable(juice, send: needToMakeJuiceCount)
        if !isContinue {
            print("음료 제조 불가")
            return
        }
        
        juice.recipe.forEach { fruit in
            fruitStore.update(fruit.key, stock: needToMakeJuiceCount)
        }
    }
    
    private func blending(juice: MixFruitJuice) {
        var needCounts = fruitStore.needCountOfMake(to: juice)
        let isContinue = isMakeable(juice, send: needCounts)
        if !isContinue {
            print("혼합음료 제조 불가")
            return
        }
        
        juice.recipe.forEach { fruit in
            guard let extractCount = needCounts.first else {
                return
            }
            fruitStore.update(fruit.key, stock: extractCount)
            needCounts.removeFirst()
        }
    }
}
