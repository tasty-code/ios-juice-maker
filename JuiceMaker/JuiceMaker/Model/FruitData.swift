//
//  FruitData.swift
//  JuiceMaker
//
//  Created by Matthew on 12/7/23.
//

import Foundation

struct FruitData {
    let name: FruitType
    var quantity: Int64
    
    init(name: FruitType, quantity: Int64) {
        self.name = name
        self.quantity = quantity
    }
}
