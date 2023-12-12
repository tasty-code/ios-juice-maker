//
//  CustomError.swift
//  JuiceMaker
//
//  Created by 권태호 on 06/12/2023.
//

import Foundation


enum fruitStoreError: Error {
    
    case currentQuantityError
    case fruitQuantityError
    case makeJuiceError
    case errorDefault
    
}

extension fruitStoreError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .currentQuantityError:
            return NSLocalizedString("currentQuantity에러", comment: "fruitUpdateError함수 에러 발생")
        case .makeJuiceError:
            return NSLocalizedString("쥬스 만들기 에러", comment: "makeJuice함수 에러 발생")
        case .errorDefault:
            return NSLocalizedString("에러발생", comment: "에러 발생 코드확인 요망")
        case .fruitQuantityError:
            return NSLocalizedString("과일은 0개 이상이여야합니다.", comment: "과일수량 에러")
        }
    }
}


