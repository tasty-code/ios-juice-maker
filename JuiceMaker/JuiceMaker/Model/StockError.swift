//
//  StockError.swift
//  JuiceMaker
//
//  Created by 지준용 on 2023/09/12.
//

import Foundation

enum StockError: Error, CustomDebugStringConvertible {
    case emptyStock
    
    var debugDescription: String {
        return "쥬스를 만들기 위한 재고가 부족합니다"
    }
}
