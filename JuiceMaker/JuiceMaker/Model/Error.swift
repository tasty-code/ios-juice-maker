//
//  Error.swift
//  JuiceMaker
//
//  Created by jun on 2023/01/05.
//

import Foundation

enum JuiceMakerError: Error {
    case outOfStock
}

extension JuiceMakerError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .outOfStock:
            return "재고가 부족합니다."
        }
    }
}
