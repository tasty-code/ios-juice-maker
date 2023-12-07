//
//  JuiceMakerError.swift
//  JuiceMaker
//
//  Created by nayeon  on 2023/12/07.
//

import Foundation

enum JuiceMakerError: String, Error {
    case insufficientStock = "재고가 부족합니다."
    case unexpected = "예기치 못한 에러가 발생했습니다."
}
