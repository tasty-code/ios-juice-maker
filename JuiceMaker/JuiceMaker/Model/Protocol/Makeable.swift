//
//  Makeable.swift
//  JuiceMaker
//
//  Created by Jason on 2023/01/04.
//

import Foundation

protocol Makeable {
    func make(single juice: SingleFruitJuice)
    func make(mix juice: MixFruitJuice)
}
