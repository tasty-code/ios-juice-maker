//
//  JuiceMakerError.swift
//  JuiceMaker
//
//  Created by 미르 & 미성
//

import Foundation

enum JuiceMakerError: LocalizedError {
    case outOfStock
    
    var description: String {
        switch self {
        case .outOfStock:
            "재고가 부족합니다."
        }
    }
}
