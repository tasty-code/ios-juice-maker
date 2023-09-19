//
//  InventoryError.swift
//  JuiceMaker
//
//  Created by Wonji Ha on 2023/09/12.
//

import Foundation

enum InventoryError: Error, CustomStringConvertible {
    case invalidError
    case noLongerConsumeError
    
    var description: String {
        switch self {
        case .invalidError:
            return "오류가 발생하였습니다. 다시 실행해주세요."
        case .noLongerConsumeError:
            return "재료가 모자라요. 재고를 수정할까요?"
        }
    }
}
