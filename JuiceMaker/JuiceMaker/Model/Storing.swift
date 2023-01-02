//
//  Store.swift
//  JuiceMaker
//
//  Created by sei_dev on 1/2/23.
//

import Foundation

protocol Storing {
    associatedtype Element: Hashable, CaseIterable
    
    var items: [Element: Int] { get set }
    
    func add(item: Element, 개수: Int) throws
    func subtract(item: Element, 개수: Int) throws
    func isEnough(item: Element, 개수: Int) -> Bool
    func isEnough(itemz: [(item: Element, 개수: Int)]) -> Bool
}
