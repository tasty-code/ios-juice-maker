//
//  OrderError.swift
//  JuiceMaker
//
//  Created by Janine on 2023/09/12.
//

import Foundation

enum OrderError: String, Error {
    case soldOut = "품절"
    case unexpected = "예기치 못한 에러가 발생했습니다."
}
