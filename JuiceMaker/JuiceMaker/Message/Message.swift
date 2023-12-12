//
//  ErrorMessage.swift
//  JuiceMaker
//
//  Created by 둘리 on 2023/12/08.
//

import UIKit

enum Message: CustomStringConvertible {
    case emptyFruitQuantity
    case failedMakeJuice
    case successMakeJuice(juice: Juice.RawValue)
    
    var description: String {
        switch self {
        case .emptyFruitQuantity:
            return "재고가 이미 비어있습니다."
        case .failedMakeJuice:
            return "재료가 모자라요. 재고를 수정할까요?"
        case .successMakeJuice(juice: let juice):
            return "\(juice) 나왔습니다! 맛있게 드세요!"
        }
    }
}
