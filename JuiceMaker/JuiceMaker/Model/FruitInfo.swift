//
//  FruitData.swift
//  JuiceMaker
//
//  Created by Matthew on 12/7/23.
//

import UIKit

struct FruitInfo {
    let name: Fruit
    var quantity: Int
    
    init(name: Fruit, quantity: Int) {
        self.name = name
        self.quantity = quantity
    }
}
