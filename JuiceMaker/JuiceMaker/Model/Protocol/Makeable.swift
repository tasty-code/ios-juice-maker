//
//  Makeable.swift
//  JuiceMaker
//
//  Created by Jason on 2023/01/04.
//

import Foundation

protocol Makeable {
    func startMake(single juice: FruitSingleJuice)
    func startMake(mix juice: FruitMixJuice)
    func requestTo(single juice: FruitSingleJuice)
    func requestTo(mix juice: FruitMixJuice)
}
