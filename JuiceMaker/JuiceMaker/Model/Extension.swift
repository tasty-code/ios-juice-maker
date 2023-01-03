//
//  Extension.swift
//  JuiceMaker
//
//  Created by 송선진 on 2023/01/03.
//

import Foundation

extension Int {
    func isNegative(subtraction sub: Int) -> Bool {
        let result = (self - sub) >= 0
        return result
    }
}
