//
//  JuiceMakerError.swift
//  JuiceMaker
//
//  Created by nayeon  on 2023/12/07.
//

import Foundation

enum JuiceMakerError: Error {
    case insufficientStock
    
    var errorMessage: String {
        switch self {
        case .insufficientStock:
            return "재고가 부족합니다."
        }
    }
}
