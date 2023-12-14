//
//  CustomError.swift
//  JuiceMaker
//
//  Created by 권태호 on 06/12/2023.
//

import Foundation

enum fruitStoreError: Error {
    case currentQuantityError
    case makeJuiceError
    case errorDefault
}

extension fruitStoreError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .currentQuantityError:
            return NSLocalizedString("currentQuantity에러", comment: "fruitUpdateError함수 에러 발생")
        case .makeJuiceError:
            return NSLocalizedString("재료가 모자라요. 재고를 수정할까요?", comment: "makeJuice함수 에러 발생")
        case .errorDefault:
            return NSLocalizedString("에러발생", comment: "에러 발생 코드확인 요망")
        }
    }
}


