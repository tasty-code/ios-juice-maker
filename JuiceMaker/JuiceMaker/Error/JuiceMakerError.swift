//
//  Error.swift
//  JuiceMaker
//
//  Created by Matthew on 12/22/23.
//

import Foundation

enum JuiceMakerError: Error, CustomStringConvertible {
    case notFoundFont
    
    var description: String {
        switch self {
        case .notFoundFont:
            return "폰트를 찾지 못했습니다."
        }
    }
}
