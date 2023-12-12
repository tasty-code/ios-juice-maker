//
//  FriutStoreViewController.swift
//  JuiceMaker
//
//  Created by dopamint on 12/12/23.
//

import UIKit

protocol FruitStoreViewController {
    var fruitStore: FruitStore { get set }
    var strawberryLabel: UILabel! { get }
    var bananaLabel: UILabel! { get }
    var pineappleLabel: UILabel! { get }
    var kiwiLabel: UILabel! { get }
    var mangoLabel: UILabel! { get }
    var labels:  Dictionary<UILabel, Fruit> { get }

    func configureFruitStoreUI()
}

extension FruitStoreViewController {
    func configureFruitStoreUI() {
        labels.forEach { $0.text = fruitStore.fruitCount(fruit: $1).description }
    }
}
