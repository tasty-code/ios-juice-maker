//
//  Error.swift
//  JuiceMaker
//
//  Created by 송선진 on 2023/01/03.
//

import Foundation

enum JuiceError: Error {
    case negativeQuantity(fruit: Fruits)
}

extension JuiceError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .negativeQuantity(let fruit):
            return "\(fruit)의 재고가 부족합니다."
        }
    }
}
