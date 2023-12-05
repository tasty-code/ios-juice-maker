//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    var fruitStore: FruitStore

    init(store: FruitStore) {
        fruitStore = store
    }

    func makeJuice(type: String) -> Bool {
        if type == "Strawberry" {
            return fruitStore.removeFruit("strawberry", quantity: 16)
        } else if type == "Banana" {
            return fruitStore.removeFruit("banana", quantity: 2)
        } else if type == "Kiwi" {
            return fruitStore.removeFruit("kiwi", quantity: 3)
        } else if type == "Pineapple" {
            return fruitStore.removeFruit("pineapple", quantity: 2)
        } else if type == "strawberryAndBanana" {
            let strawberrySuccess = fruitStore.removeFruit("strawberry", quantity: 10)
            let bananaSuccess = fruitStore.removeFruit("banana", quantity: 1)
            return strawberrySuccess && bananaSuccess
        } else if type == "Mango" {
            return fruitStore.removeFruit("mango", quantity: 3)
        } else if type == "Mango Kiwi" {
            let mangoSuccess = fruitStore.removeFruit("mango", quantity: 2)
            let kiwiSuccess = fruitStore.removeFruit("kiwi", quantity: 1)
            return mangoSuccess && kiwiSuccess
        } else {
            return false
        }
    }
}
