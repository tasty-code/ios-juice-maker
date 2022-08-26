//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
//    var strawberry : Int
//    var banana : Int
//    var pineapple : Int
//    var kiwi : Int
//    var mango : Int
//    var change: Int
//
//    init() {
//        strawberry = 10
//        banana = 10
//        pineapple = 10
//        kiwi = 10
//        mango = 10
//        change = 0
//    }
  
    enum Fruit {
        case strawberry, banana, pineapple, kiwi, mango
        
        var name: String {
            switch self {
            case .strawberry:
                return "딸기"
            case .banana:
                return "바나나"
            case .pineapple:
                return "파인애플"
            case .kiwi:
                return "키위"
            case .mango:
                return "망고"
            }
        }
    }
}
