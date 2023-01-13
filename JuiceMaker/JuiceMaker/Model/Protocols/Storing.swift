//
//  Store.swift
//  JuiceMaker
//
//  Created by sei_dev on 1/2/23.
//

import Foundation

protocol Storing {
    associatedtype Item: Ingredientable
    
    var items: [Item: Int] { get }
    
    mutating func add(item: Item, count: Int)
    mutating func subtract(pairOfItems: [Item: Int]) -> Bool
    func hasEnough(pairOfItems: [Item: Int]) -> Bool
}

extension Storing {
    func hasEnough(pairOfItems stocks: [Item: Int]) -> Bool {
        return stocks.allSatisfy { (item: Item, count: Int) in
            items[item, default: 0] >= count
        }
    }
}
