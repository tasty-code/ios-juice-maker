//
//  ErrorMessage.swift
//  JuiceMaker
//
//  Created by 김수경 on 2023/09/15.
//

import Foundation

enum ErrorMessage: Error, CustomDebugStringConvertible {
    case stockInsufficient(_ fruit: Fruit)
    case stockInsufficients(_ frutits: [Fruit])
    case invalidInput
    
    var debugDescription: String {
        switch self {
        case .stockInsufficient(let fruit) :
            return "주문실패😭 \(fruit.rawValue)가(이) 부족합니다."
        case .stockInsufficients(let fruits):
            return "주문실패😭 \(fruits[0].rawValue), \(fruits[1].rawValue)가(이) 부족합니다."
        case .invalidInput:
            return "잘못된 입력입니다."
        }
    }
}
