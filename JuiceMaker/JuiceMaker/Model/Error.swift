//
//  Error.swift
//  JuiceMaker
//
//  Created by jun on 2023/01/05.
//

import Foundation

enum JuiceMakerError: Error {
    case outOfStock
    case notExistFruit
}

extension JuiceMakerError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .outOfStock:
            return "재고가 부족합니다."
        case .notExistFruit:
            return "과일 저장소에 존재하지 않는 과일입니다."
        }
    }
}
