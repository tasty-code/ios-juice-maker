//
//  Collection.swift
//  JuiceMaker
//
//  Created by Jason on 2023/01/13.
//

import Foundation

extension Array {
    subscript (safe index: Index) -> Element? {
        return indices ~= index ? self[index] : nil
    }
}
