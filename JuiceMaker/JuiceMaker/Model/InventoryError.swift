//
//  InventoryError.swift
//  JuiceMaker
//
//  Created by Wonji Ha on 2023/09/12.
//

import Foundation

enum InventoryError: Error, CustomStringConvertible {
    case invalidMenuError
    case noLongerConsumeError
    
    var description: String {
        switch self {
        case .invalidMenuError: return "존재하지 않는 메뉴입니다."
        case .noLongerConsumeError: return "재고가 부족하여 주스를 만들 수 없습니다."
        }
    }
}
