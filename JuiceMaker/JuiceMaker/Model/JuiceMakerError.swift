//
//  JuiceMakerError.swift
//  JuiceMaker
//  Created by Kyle & L
//

import Foundation

enum JuiceMakerError: Error {
    case outOfStock(fruit: String)
}

extension JuiceMakerError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .outOfStock(let fruit):
            return "\(fruit) 재고 없음"
        }
    }
}
