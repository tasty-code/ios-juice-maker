//
//  Error.swift
//  JuiceMaker
//
//  Created by Swain Yun on 2023/09/12.
//

import Foundation

@frozen enum JuiceMakerError: Error {
    case invalidSelection
    case outOfStock
}
