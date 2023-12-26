//
//  Fruit.swift
//  JuiceMaker
//
//  Created by 장우석 on 12/5/23.
//

import Foundation

enum Fruit: String, CaseIterable {
    case strawberry = "딸기"
    case banana = "바나나"
    case kiwi = "키위"
    case pineapple = "파인애플"
    case mango = "망고"
}

extension Fruit {
    var maximum: Double {
        return 1000.0
    }
    
    var minimum: Double {
        return 0.0
    }
}
    
