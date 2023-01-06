//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

final class FruitStore {
    static let shared = FruitStore()
    var store = [FruitList: Int]()
    
    private init() {
        for fruit in FruitList.allCases {
            store[fruit] = 10
        }
    }
    
    func changeStock(fruit: FruitList, number: Int) {
        switch fruit {
        case .strawberry:
            store.updateValue(number, forKey: .strawberry)
        case .banana:
            store.updateValue(number, forKey: .banana)
        case .pineApple:
            store.updateValue(number, forKey: .pineApple)
        case .kiwi:
            store.updateValue(number, forKey: .kiwi)
        case .mango:
            store.updateValue(number, forKey: .mango)
        }
    }
    
    func storeValue(fruit type: FruitList) -> Int? {
        var currentStoreValue: Int?
        
        store.forEach { (key: FruitList, value: Int) in
            if key == type {
                switch key {
                case .strawberry:
                    currentStoreValue = store[.strawberry]
                case .banana:
                    currentStoreValue = store[.banana]
                case .kiwi:
                    currentStoreValue = store[.kiwi]
                case .pineApple:
                    currentStoreValue = store[.pineApple]
                case .mango:
                    currentStoreValue = store[.mango]
                }
            }
        }
        return currentStoreValue
    }
    
    func isPossibleMakeSingle(juice: FruitList, stockNumber: Int) -> Bool {
        switch juice {
        case .strawberry:
            guard stockNumber >= 16 else {
                return false
            }
        case .banana:
            guard stockNumber >= 2 else {
                return false
            }
        case .kiwi:
            guard stockNumber >= 3 else {
                return false
            }
        case .pineApple:
            guard stockNumber >= 2 else {
                return false
            }
        case .mango:
            guard stockNumber >= 3 else {
                return false
            }
        }
        return true
    }
    
    func isPossibleMakeMix(juice: FruitMixJuice, stockNumber: (Int, Int)) -> Bool {
        switch juice {
        case .strawberryAndBanana:
            guard stockNumber.0 >= 10, stockNumber.1 >= 1 else {
                return false
            }
        case .mangoAndKiwi:
            guard stockNumber.0 >= 2, stockNumber.1 >= 1 else {
                return false
            }
        }
        return true
    }
}
