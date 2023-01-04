//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

final class FruitStore {
    static let shared = FruitStore()
    var store = [FruitList:Int]()
    
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
}
