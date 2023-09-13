//
//  ErrorPrinter.swift
//  JuiceMaker
//
//  Created by 전성수 on 2023/09/13.
//

import Foundation

enum ErrorPrinter: Error, CustomDebugStringConvertible {
    case invalidInput
    case stockInsufficient(_ fruit: [String])
    
    var debugDescription: String {
        switch self {
        case .stockInsufficient(let fruit):
            if fruit.count == 2 {
                return "주문실패😭 \(fruit[0]), \(fruit[1])가(이) 부족합니다."
            } else {
                return "주문실패😭 \(fruit[0])가(이) 부족합니다."
            }
        case .invalidInput:
            return "잘못된 입력입니다."
        }
    }
}
