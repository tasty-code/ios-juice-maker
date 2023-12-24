//
//  FruitStockDelegate.swift
//  JuiceMaker
//
//  Created by 장우석 on 12/24/23.
//

import Foundation

protocol FruitStockDelegate: AnyObject {
    func fruitCount(fruit: Fruit) -> Int
    func updateFruitStore(newFruitStore: Dictionary<Fruit, Int>)
}
