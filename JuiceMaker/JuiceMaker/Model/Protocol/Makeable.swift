//
//  Makeable.swift
//  JuiceMaker
//
//  Created by Jason on 2023/01/04.
//

import Foundation

protocol Makeable {
    func make(single juice: FruitSingleJuice)
    func make(mix juice: FruitMixJuice)
}
