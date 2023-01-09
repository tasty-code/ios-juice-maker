//
//  StockError.swift
//  JuiceMaker
//
//  Created by 김용재 on 2023/01/04.
//

import Foundation

enum StockError: LocalizedError {
    case noCorrespondingFruit
    case notEnoughToMakeJuice
    case notEnoughToChange
    
    var errorDescription: String? {
        switch self {
        case .noCorrespondingFruit:
            return "일치하는 과일이 없습니다."
        case .notEnoughToMakeJuice:
            return "재료가 모자라요."
        case .notEnoughToChange:
            return "더 이상 변경할 수 없어요."
        }
    }
    
    var userMessage: String {
        switch self {
        case .noCorrespondingFruit:
            return "관리자에게 문의하세요."
        case .notEnoughToMakeJuice:
            return "재고를 수정할까요?"
        case .notEnoughToChange:
            return "과일이 이미 0개랍니다."
        }
    }
}
