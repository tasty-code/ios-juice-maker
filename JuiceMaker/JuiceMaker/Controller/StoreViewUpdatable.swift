//
//  StoreViewUpdatable.swift
//  JuiceMaker
//
//  Created by 장우석 on 12/14/23.
//

import UIKit

protocol StoreViewUpdatable {
    var fruitStore: FruitStore { get set }
    var labels:  Dictionary<UILabel, Fruit> { get }

    func configureFruitStoreUI()
}

extension StoreViewUpdatable {
    func configureFruitStoreUI() {
        labels.forEach { $0.text = fruitStore.fruitCount(fruit: $1).description }
    }
}
