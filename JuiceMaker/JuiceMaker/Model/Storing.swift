//
//  Store.swift
//  JuiceMaker
//
//  Created by sei_dev on 1/2/23.
//

import Foundation

typealias Storeable = Hashable & CaseIterable

protocol Storing {
    
    associatedtype Element: Storeable
    
    var items: [Element: Int] { get }
    
    mutating func add(item: Element, count: Int)
    mutating func subtract(pairOfItems: [Element: Int])
    func hasEnough(pairOfItems: [Element: Int]) -> Bool
}

extension Storing {
    func hasEnough(pairOfItems: [Element: Int]) -> Bool {
        return pairOfItems.allSatisfy { (item: Element, count: Int) in
            items[item, default: 0] >= count
        }
    }
}
