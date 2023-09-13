//
//  FruitStock.swift
//  JuiceMaker
//
//  Created by 전성수 on 2023/09/12.
//

import Foundation

class FruitStock {
    var currentStock: Int = 10
    var singleConsumption: Int
    var combineConsumption: Int?
    
    init(singleConsumption: Int, combineConsumption: Int? = nil) {
        self.singleConsumption = singleConsumption
        self.combineConsumption = combineConsumption
    }
}
