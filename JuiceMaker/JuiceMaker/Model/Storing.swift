//
//  Store.swift
//  JuiceMaker
//
//  Created by sei_dev on 1/2/23.
//

import Foundation

typealias Storeable = Hashable

protocol Storing {
    
    associatedtype Element: Storeable
    
    var items: [Element: Int] { get }
    
    mutating func add(item: Element, count: Int)
    mutating func subtract(pairOfItems: [Element: Int]) throws
}
