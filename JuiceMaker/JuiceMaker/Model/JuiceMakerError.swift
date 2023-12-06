//
//  Error.swift
//  JuiceMaker
//
//  Created by 강창현 on 12/6/23.
//

import Foundation

enum JuiceMakerError: Error {
    case outOfStock(fruit: String)
}
