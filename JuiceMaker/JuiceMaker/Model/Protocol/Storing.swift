//
//  Store.swift
//  JuiceMaker
//
//  Created by sei_dev on 1/2/23.
//

protocol Storing {
    associatedtype Item: Ingredientable
    
    var items: [Item: Int] { get }
    var itemList: [Item] { get }
    
    mutating func add(item: Item, count: Int)
    mutating func subtract(pairOfItems: [Item: Int]) -> Bool
    mutating func setStocks(pairOfItems: [Item: Int])
    
    func hasEnough(pairOfItems: [Item: Int]) -> Bool
    func stockInfo(of: [Item]) -> [Item: Int]
}

extension Storing {
    var itemList: [Item] {
        Array(items.keys)
    }
    
    func hasEnough(pairOfItems stocks: [Item: Int]) -> Bool {
        return stocks.allSatisfy { (item: Item, count: Int) in
            items[item, default: .zero] >= count
        }
    }
    
    func stockInfo(of itemList: [Item]) -> [Item: Int] {
        let itemSet = Set(itemList)
        let info = items.filter { (item, _) in
            itemSet.contains(item)
        }
        return info
    }
}
