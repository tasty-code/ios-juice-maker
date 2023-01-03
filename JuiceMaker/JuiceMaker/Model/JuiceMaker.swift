//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    
    private let fruitStore = FruitStore.shared
    
    enum Juice {
        case strawberry
        case banana
        case kiwi
        case pineapple
        case strawberryBanana
        case mango
        case mangoKiwi
        
        // TODO:- 레시피 적기(과일 필요한 개수)
        
    }
    
    // 쥬스 제조 -> 과일 저장소 재고 확인을 먼저하고, 재고 감소를 호출함
    func startBlending () {
        fruitStore.decrease()
    }
    
}
