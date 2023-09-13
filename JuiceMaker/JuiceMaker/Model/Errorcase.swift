//
//  Errorcase.swift
//  JuiceMaker
//
//  Created by BOMBSGIE on 2023/09/13.
//

import Foundation


enum Errorcase: Error, CustomDebugStringConvertible{
    
    case canNotFound, outOfStock
    
    var debugDescription: String {
        switch self {
        case .canNotFound: return "해당 과일을 찾을 수 없습니다."
        case .outOfStock: return "해당 과일의 재고가 부족합니다."
        }
    }
    
}
