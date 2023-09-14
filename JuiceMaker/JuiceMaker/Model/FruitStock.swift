//
//  FruitStock.swift
//  JuiceMaker
//
//  Created by 전성수 on 2023/09/12.
//

import Foundation

struct FruitStock {
    var currentStock: Int = 10
    var singleConsumption: Int
    var combineConsumption: Int?
    let name: String
    
    init(name: String, singleConsumption: Int, combineConsumption: Int? = nil) {
        self.name = name
        self.singleConsumption = singleConsumption
        self.combineConsumption = combineConsumption
    }
}
