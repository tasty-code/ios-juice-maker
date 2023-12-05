//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    var strawberryCount: Int
    var bananaCount: Int
    var pineappleCount: Int
    var kiwiCount: Int
    var mangoCount: Int

    init() {
        strawberryCount = 10
        bananaCount = 10
        pineappleCount = 10
        kiwiCount = 10
        mangoCount = 10
    }

    func addFruit(_ fruit: String, quantity: Int) {
        if fruit == "strawberry" {
            strawberryCount += quantity
        } else if fruit == "banana" {
            bananaCount += quantity
        } else if fruit == "pineapple" {
            pineappleCount += quantity
        } else if fruit == "kiwi" {
            kiwiCount += quantity
        } else if fruit == "mango" {
            mangoCount += quantity
        }
    }

    func removeFruit(_ fruit: String, quantity: Int) -> Bool {
        if fruit == "strawberry" && strawberryCount >= quantity {
            strawberryCount -= quantity
            return true
        } else if fruit == "banana" && bananaCount >= quantity {
            bananaCount -= quantity
            return true
        } else if fruit == "pineapple" && pineappleCount >= quantity {
            pineappleCount -= quantity
            return true
        } else if fruit == "kiwi" && kiwiCount >= quantity {
            kiwiCount -= quantity
            return true
        } else if fruit == "mango" && mangoCount >= quantity {
            mangoCount -= quantity
            return true
        } else {
            return false
        }
    }
}
