//
//  FruitStoreViewController.swift
//  JuiceMaker
//
//  Created by 장우석 on 12/15/23.
//

import UIKit

class FruitStoreViewController: UIViewController{
    var fruitStore: FruitStore
    var labels: Dictionary<UILabel, Fruit>
    
    required init?(coder aDecoder: NSCoder) {
        self.fruitStore = FruitStore.shared
        self.labels = [:]
        super.init(coder: aDecoder)
    }
}

extension FruitStoreViewController {
    func configureFruitStoreUI() {
        labels.forEach { $0.text = fruitStore.fruitCount(fruit: $1).description }
    }
}
