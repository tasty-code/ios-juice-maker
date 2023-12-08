//
//  JuiceMakerError.swift
//  JuiceMaker
//  Created by Kyle & L
//

import Foundation

import Foundation

enum JuiceMakerError: Error {
    case outOfStock(fruit: String)
}

extension JuiceMakerError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .outOfStock(let fruit):
            return "\(fruit)가 모자라요. 재고를 수정할까요?"
        }
    }
}
