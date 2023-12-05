//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    private var fruitStore = FruitStore()
    
    mutating func makeJuice(juice: String) {
        let recipe = juiceRecipe(juice: juice)
    }
    
    private func juiceRecipe(juice: String) -> [String: Int] {
        switch juice {
        case "strawberry":
            return ["strawberry": 16]
        case "banana":
            return ["banana": 2]
        case "pineapple":
            return ["pineapple": 2]
        case "kiwi":
            return ["kiwi": 3]
        case "mango":
            return ["mango": 3]
        case "strawberrybanana":
            return ["strawberry": 10,"banana": 1]
        case "mangokiwi":
            return ["mango": 2, "kiwi": 1]
        default:
            return [:]
        }
    }
}
