//
//  ErrorPrinter.swift
//  JuiceMaker
//
//  Created by 전성수 on 2023/09/13.
//

import Foundation

enum ErrorPrinter: Error, CustomDebugStringConvertible {
    case stockInsufficient(_ fruit: String)
    case stockInsufficients(_ frutits: [String])
    case invalidInput
    
    var debugDescription: String {
        switch self {
        case .stockInsufficient(let fruit) :
            return "주문 실패😭 \(fruit)가(이) 부족합니다."
        case .stockInsufficients(let fruits):
            return "주문 실패😭 \(fruits[0]), \(fruits[1])가(이) 부족합니다."
        case .invalidInput:
            return "잘못된 입력입니다."
        }
    }
}

