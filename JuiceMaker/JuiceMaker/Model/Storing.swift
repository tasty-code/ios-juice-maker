//
//  Store.swift
//  JuiceMaker
//
//  Created by sei_dev on 1/2/23.
//

import Foundation

protocol Storing {
    typealias Storeable = Hashable & CaseIterable
    associatedtype Element: Storeable
    
    var items: [Element: Int] { get set }
    
    mutating func add(item: Element, count: Int)
    mutating func subtract(item: Element, count: Int)
    func hasEnough(item: Element, count: Int) -> Bool
}
