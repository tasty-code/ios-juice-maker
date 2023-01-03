//
//  Maker.swift
//  JuiceMaker
//
//  Created by sei_dev on 1/3/23.
//

import Foundation

protocol Maker {
    associatedtype Element
    var store: any Storing { get }
    
    func make(item: Element) throws -> Element
}
