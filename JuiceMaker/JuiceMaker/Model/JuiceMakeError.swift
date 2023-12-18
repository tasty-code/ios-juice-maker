//
//  JuiceMakeError.swift
//  JuiceMaker
//
//  Created by 유니 & 이안 on 2023/12/12.
//

import Foundation

enum JuiceMakerError: LocalizedError {
    case outOfStock(fruit: Fruit)
    case negativeAmount(fruit: Fruit)
    
    var message: String {
        switch self {
        case .outOfStock(let fruit):
            return "\(fruit.name)의 재고가 부족합니다 재고를 수정할까요?"
        case .negativeAmount(let fruit):
            return "\(fruit.name)의 재고가 음수입니다."
        }
    }
}
