//
//  JuiceMakerError.swift
//  JuiceMaker
//  Created by Kyle & L
//

import Foundation

enum JuiceMakerError: LocalizedError {
    case outOfStock(fruit: String)
    
    var errorDescription: String? {
        switch self {
        case .outOfStock(let fruit):
            return "\(fruit)가 모자라요. 재고를 수정할까요?"
        }
    }
}
