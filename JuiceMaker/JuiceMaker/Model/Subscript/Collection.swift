//
//  Collection.swift
//  JuiceMaker
//
//  Created by Jason on 2023/01/13.
//

import Foundation

extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil 
    }
}
