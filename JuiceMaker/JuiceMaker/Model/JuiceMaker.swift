//
//  JuiceMaker - JuiceMaker.swift
//  Created by Kyle& L
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    
    private var fruitStore: FruitStore = FruitStore()
    
    func makeStrawberryJuice() {
        guard
            fruitStore.strawberryStock >= 16
        else {
            return print("재료 소진")
        }
        fruitStore.strawberryStock -= 16
    }
    
    func makeBananaJuice() {
        guard
            fruitStore.bananaStock >= 2
        else {
            return print("재료 소진")
        }
        fruitStore.bananaStock -= 2
    }
    
    func makeKiwiJuice() {
        guard
            fruitStore.kiwiStock >= 3
        else {
            return print("재료 소진")
        }
        fruitStore.kiwiStock -= 3
    }
    
    func makePineappleJuice() {
        guard
            fruitStore.pineappleStock >= 2
        else {
            return print("재료 소진")
        }
        fruitStore.pineappleStock -= 2
    }
    
    func makeStrawberryBananaJuice() {
        guard
            fruitStore.strawberryStock >= 10,
            fruitStore.bananaStock >= 1
        else {
            return print("재료 소진")
        }
        fruitStore.strawberryStock -= 10
        fruitStore.bananaStock -= 1
    }
    
    func makeMangojuice() {
        guard
            fruitStore.mangoStock >= 3
        else {
            return print("재료 소진")
        }
        fruitStore.mangoStock -= 3
    }
    
    func makeMangoKiwiJuice() {
        guard
            fruitStore.mangoStock >= 2,
            fruitStore.kiwiStock >= 1
        else {
            return print("재료 소진")
        }
        fruitStore.mangoStock -= 2
        fruitStore.kiwiStock -= 1
    }
}
