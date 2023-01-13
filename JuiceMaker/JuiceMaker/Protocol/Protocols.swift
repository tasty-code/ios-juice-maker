//
//  Protocols.swift
//  JuiceMaker
//
//  Created by DONGWOOK SEO on 2023/01/12.
//

import Foundation

protocol FruitStockManagable {
    var fruitName: Fruits { get }
}

protocol JuiceOrderable {
    var juice: Juices { get }
}
