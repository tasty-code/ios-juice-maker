//
//  Store.swift
//  JuiceMaker
//
//  Created by sei_dev on 1/2/23.
//

import Foundation

protocol Storable {
    func add(과일: Fruit, 개수: Int) throws
    func subtract()
    func check()
}
