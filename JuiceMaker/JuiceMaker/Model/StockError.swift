//
//  StockError.swift
//  JuiceMaker
//
//  Created by 지준용 on 2023/09/12.
//

import Foundation

enum StockError: Error, CustomStringConvertible {
    case emptyStock
    
    var description: String {
        return "재고가 부족합니다."
    }
}
