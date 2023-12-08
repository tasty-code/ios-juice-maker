//
//  JuiceError.swift
//  JuiceMaker
//
//  Created by 이주상 on 2023/12/06.
//

import Foundation

enum JuiceError: LocalizedError {
    case outOfStock
    case quantityOfAllFruitsAccessFailed
        
    public var errorDescription: String? {
        switch self {
        case .outOfStock:
            return NSLocalizedString("과일 재고가 부족합니다.", comment: "outOfStock")
        case .quantityOfAllFruitsAccessFailed:
            return NSLocalizedString("과일 재고 접근 실패", comment: "quantityOfAllFruitsAccessFailed")
        }
    }
}
