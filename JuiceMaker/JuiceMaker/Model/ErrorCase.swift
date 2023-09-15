//
//  Errorcase.swift
//  JuiceMaker
//
//  Created by BOMBSGIE on 2023/09/13.
//

import Foundation

enum MessageLog {
    
    enum AlertCase {
        case sucess(juiceName: String)
        case outOfStock
        
        var message: String? {
            switch self {
            case .sucess(let juiceName):
                return "\(juiceName) 나왔습니다. 맛있게 드세요!"
            
            case .outOfStock:
                return "재료가 모자라요. 재고를 수정할까요?"
            }
        }
    }
   
    
    
    
    enum ErrorCase: Error, CustomDebugStringConvertible {
        
        case canNotFound, outOfStock
        
        var debugDescription: String {
            switch self {
            case .canNotFound:
                return "해당 과일을 찾을 수 없습니다."
                
            case .outOfStock:
                return "해당 과일의 재고가 부족합니다."
            }
        }
        
    }
}
