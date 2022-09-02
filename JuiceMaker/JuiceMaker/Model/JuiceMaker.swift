//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    private var fruitStore = FruitStore()
    
    func makeJuice(of juiceType: FruitStore.FruitJuice) {
        switch juiceType {
        case .strawberry:
            fruitStore.decreaseStock(fruit: .strawberry, stock: 16)
        case .banana:
            fruitStore.decreaseStock(fruit: .banana, stock: 2)
        case .pineapple:
            fruitStore.decreaseStock(fruit: .pineapple, stock: 2)
        case .kiwi:
            fruitStore.decreaseStock(fruit: .kiwi, stock: 3)
        case .mango:
            fruitStore.decreaseStock(fruit: .mango, stock: 3)
        case .strawberryBanana:
            fruitStore.decreaseStock(fruit: .strawberry, stock: 10)
            fruitStore.decreaseStock(fruit: .banana, stock: 1)
        case .mangoKiwi:
            fruitStore.decreaseStock(fruit: .mango, stock: 2)
            fruitStore.decreaseStock(fruit: .kiwi, stock: 1)
        }
    }
    
    func getCurrentStock(of fruit: FruitStore.Fruit) -> Int {
        var currentStockOfFruit = 0
        if let currentStock = fruitStore.fruits[fruit] {
            currentStockOfFruit = currentStock
        }
        
        return currentStockOfFruit
    }
    
    func canMakeJuice(of juiceType: FruitStore.FruitJuice) -> Bool {
        var canMakeJuice = true
        let fruits = FruitStore.Fruit.self
        
        switch juiceType {
        case .strawberry:
            if getCurrentStock(of: fruits.strawberry) < 16 {
                print("딸기 재고가 부족합니다.")
                canMakeJuice = false
            }
        case .banana:
            if getCurrentStock(of: fruits.banana) < 2 {
                print("바나나 재고가 부족합니다.")
                canMakeJuice = false
            }
        case .pineapple:
            if getCurrentStock(of: fruits.pineapple) < 2 {
                print("파인애플 재고가 부족합니다.")
                canMakeJuice = false
            }
        case .kiwi:
            if getCurrentStock(of: fruits.kiwi) < 3 {
                print("키위 재고가 부족합니다.")
                canMakeJuice = false
            }
        case .mango:
            if getCurrentStock(of: fruits.mango) < 3 {
                print("망고 재고가 부족합니다.")
                canMakeJuice = false
            }
        case .strawberryBanana:
            if getCurrentStock(of: fruits.strawberry) < 10 && getCurrentStock(of: fruits.banana) < 1 {
                print("딸바 재고가 부족합니다.")
                canMakeJuice = false
            }
        case .mangoKiwi:
            if getCurrentStock(of: fruits.mango) < 2 && getCurrentStock(of: fruits.kiwi) < 1 {
                print("망키 재고가 부족합니다.")
                canMakeJuice = false
            }
        }
        
        return canMakeJuice
    }
}
