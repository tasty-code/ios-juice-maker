//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    
    private let fruitStore = FruitStore.shared
    
    /// 쥬스 제조 메서드
    func makeJuice(juiceType: Juice) throws {
        switch juiceType {
        case .strawberry:
            if fruitStore.strawberry < 16 {
                throw JuiceMakerError.invalidRequest
            }
            fruitStore.strawberry -= 16
        case .banana:
            if fruitStore.banana < 2 {
                throw JuiceMakerError.invalidRequest
            }
            fruitStore.banana -= 2
        case .kiwi:
            if fruitStore.kiwi < 3 {
                throw JuiceMakerError.invalidRequest
            }
            fruitStore.kiwi -= 3
        case .pineapple:
            if fruitStore.pineapple < 2 {
                throw JuiceMakerError.invalidRequest
            }
            fruitStore.pineapple -= 2
        case .strawberryBanana:
            if fruitStore.strawberry < 10 || fruitStore.banana < 1 {
                throw JuiceMakerError.invalidRequest
            }
            fruitStore.strawberry -= 10
            fruitStore.banana -= 1
        case .mango:
            if fruitStore.mango < 3 {
                throw JuiceMakerError.invalidRequest
            }
            fruitStore.mango -= 3
        case .mangoKiwi:
            if fruitStore.mango < 2 || fruitStore.kiwi < 1 {
                throw JuiceMakerError.invalidRequest
            }
            fruitStore.mango -= 2
            fruitStore.kiwi -= 1
        }
    }
}
