//
//  ViewID.swift
//  JuiceMaker
//
//  Created by dopamint on 12/12/23.
//

import Foundation

enum ViewID {
    case firsrVC
    case secondVC
}

extension ViewID {
    var id: String {
        switch self {
        case .firsrVC:
            return "firstVC"
        case .secondVC:
            return "secondVC"
        }
    }
}
