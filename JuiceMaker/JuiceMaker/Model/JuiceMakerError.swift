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
            "재고가 모자라요. 재고를 수정할까요?"
        }
    }
}
