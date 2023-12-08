//
//  JuiceMakerError.swift
//  JuiceMaker
//
//  Created by 미르 & 미성
//

import Foundation

enum JuiceMakerError: LocalizedError {
    case outOfStock
    case cannotFindLabel
    case cannotFindJuice
    
    var description: String {
        switch self {
        case .outOfStock:
            "재고가 모자라요. 재고를 수정할까요?"
        case .cannotFindLabel:
            "Label 요소를 찾을 수 없습니다."
        case .cannotFindJuice:
            "버튼에 적힌 쥬스를 찾을 수 없습니다."
        }
    }
}
