//
//  JuiceMakerError.swift
//  JuiceMaker
//
//  Created by nayeon  on 2023/12/07.
//

import Foundation

enum JuiceMakerError: Error {
    case insufficientStock
    case unexpected
    
    var errorMessage: String {
        switch self {
        case .insufficientStock:
            return "재고가 부족합니다."
        case .unexpected:
            return "예기치 못한 에러가 발생했습니다."
        }
    }
}
