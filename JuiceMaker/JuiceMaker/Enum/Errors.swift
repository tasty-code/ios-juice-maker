//
//  Errors.swift
//  JuiceMaker
//
//  Created by DONGWOOK SEO on 2023/01/03.
//

import Foundation

enum Errors: LocalizedError {
    case ouOfStock
    case notEnuoghCoin
    case outOfExchanges
    
    var errorDescription: String? {
        switch self {
        case .ouOfStock:
            return "재료가 모자라요. 재고를 수정할까요?"
        case .notEnuoghCoin:
            return "잔액부족"
        case .outOfExchanges:
            return "거스름돈 부족"
        }
    }
}
