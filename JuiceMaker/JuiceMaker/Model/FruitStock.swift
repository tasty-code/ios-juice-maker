//
//  FruitStock.swift
//  JuiceMaker
//
//  Created by 전성수 on 2023/09/12.
//

import Foundation

class FruitStock {
    var currentStock: Int
    var singleConsumption: Int
    var combineConsumption: Int
    
    init(currentStock: Int, singleConsumption: Int, combineConsumption: Int) {
        self.currentStock = currentStock
        self.singleConsumption = singleConsumption
        self.combineConsumption = combineConsumption
    }
}
