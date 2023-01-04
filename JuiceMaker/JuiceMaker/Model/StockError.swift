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
            return "쥬스를 만들기에 재고가 부족합니다."
        case .notEnoughToChange:
            return "수량을 변경하기에 재고가 충분하지 않습니다."
        }
    }
}
