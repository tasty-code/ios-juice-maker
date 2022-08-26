//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    private var fruitStore = FruitStore()
    
    func makeJuiceOf(_ juiceType: FruitJuice) {
        switch juiceType {
        case .strawberry:
            fruitStore.changeStock(strawberry: -16)
        case .banana:
            fruitStore.changeStock(banana: -2)
        case .pineapple:
            fruitStore.changeStock(pineapple: -2)
        case .kiwi:
            fruitStore.changeStock(kiwi: -3)
        case .mango:
            fruitStore.changeStock(mango: -3)
        case .strawberryBanana:
            fruitStore.changeStock(strawberry: -10, banana: -1)
        case .mangoKiwi:
            fruitStore.changeStock(kiwi: -1, mango: -2)
        }
    }
    
    func canMakeJuiceOf(juiceType: FruitJuice) {
        switch juiceType {
        case .strawberry:
            if fruitStore.strawberry < 16 {
                print("딸기 재고가 부족합니다.")
            }
        case .banana:
            if fruitStore.banana < 2 {
                print("바나나 재고가 부족합니다.")
            }
        case .pineapple:
            if fruitStore.pineapple < 2 {
                print("파인애플 재고가 부족합니다.")
            }
        case .kiwi:
            if fruitStore.kiwi < 3 {
                print("키위 재고가 부족합니다.")
            }
        case .mango:
            if fruitStore.mango < 3 {
                print("망고 재고가 부족합니다.")
            }
        case .strawberryBanana:
            if fruitStore.strawberry < 10 && fruitStore.banana < 1 {
                print("딸바 재고가 부족합니다.")
            }
        case .mangoKiwi:
            if fruitStore.mango < 2 && fruitStore.kiwi < 1 {
                print("망키 재고가 부족합니다.")
            }
        }
    }
}
