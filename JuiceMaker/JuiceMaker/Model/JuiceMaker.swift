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
            blending(juice: .strawberry)
            break
        case .banana:
            blending(juice: .banana)
            break
        case .kiwi:
            blending(juice: .kiwi)
            break
        case .pineApple:
            blending(juice: .pineApple)
            break
        case .mango:
            blending(juice: .mango)
            break
        }
    }
    
    func make(mix juice: MixFruitJuice) {
        switch juice {
        case .strawberryBanana:
            blending(juice: .strawberryBanana)
            break
        case .mangoKiwi:
            blending(juice: .mangoKiwi)
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
        var isContinue = [true]
        var needCounts = consumes
        
        juice.recipe.forEach { fruit in
            guard let extractCount = needCounts.first else {
                return
            }
            let discern = fruitStore.isRemainFruit(type: fruit.key, count: extractCount)
            isContinue.append(discern)
            
            if !discern {
                print("\(fruit.key) 재고가 없습니다!")
            }
            needCounts.removeFirst()
        }
        guard isContinue.contains(false) else {
            return true
        }
        return false
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
