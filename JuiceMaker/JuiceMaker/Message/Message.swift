//
//  ErrorMessage.swift
//  JuiceMaker
//
//  Created by 둘리 on 2023/12/08.
//

import UIKit

enum Message: CustomStringConvertible {
    case emptyFruitQuantity
    case successMakeJuiceTitle
    case successMakeJuice(juice: Juice.RawValue)
    case failedMakeJuiceTitle
    case failedMakeJuice

    var description: String {
        switch self {
        case .emptyFruitQuantity:
            return "재고가 이미 비어있습니다."
        case .successMakeJuiceTitle:
            return "쥬스 제작 완료!"
        case .successMakeJuice(juice: let juice):
            return "\(juice) 나왔습니다! 맛있게 드세요!"
        case .failedMakeJuiceTitle:
            return "쥬스 제작 실패!"
        case .failedMakeJuice:
            return "재료가 모자라요. 재고를 수정할까요?"
        }
    }
}
