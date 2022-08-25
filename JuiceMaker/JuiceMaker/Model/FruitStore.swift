//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    class Storage {
        private(set) var amount: Int = 10
        
        func plusAmount(to amount: Int) {
            self.amount += amount
        }
        func minusAmount(to amount: Int) {
            self.amount -= amount
        }
    }
    enum Fruit {
//        static let strawberry = Storage()
//        static let banana = Storage()
//        static let pineapple = Storage()
//        static let kiwi = Storage()
//        static let mango = Storage()
        
        case strawberry
        case banana
        case pineapple
        case kiwi
        case mango
        
    }
}
