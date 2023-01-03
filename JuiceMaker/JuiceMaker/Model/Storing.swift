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
    
    mutating func add(item: Element, 개수: Int)
    mutating func subtract(item: Element, 개수: Int) throws
    func isEnough(item: Element, 개수: Int) -> Bool
    func isEnough(itemz: [(item: Element, 개수: Int)]) -> Bool
}
