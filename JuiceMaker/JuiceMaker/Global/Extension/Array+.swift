//
//  Dictionary+.swift
//  JuiceMaker
//
//  Created by J.E on 2023/01/10.
//

import Foundation

extension Array {
    subscript (safe index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }
}
