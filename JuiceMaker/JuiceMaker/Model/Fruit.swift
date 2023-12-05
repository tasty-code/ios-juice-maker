//
//  Fruit.swift
//  JuiceMaker
//
//  Created by 김동준 on 12/5/23.
//

enum Fruit: String, CaseIterable, CustomStringConvertible {
    case strawberry = "딸기"
    case banana = "바나나"
    case pineapple = "파인애플"
    case kiwi = "키위"
    case mango = "망고"
    
    var description: String {
        return self.rawValue
    }
}
