//
//  FruitStoreViewController.swift
//  JuiceMaker
//
//  Created by 장우석 on 12/15/23.
//

import UIKit

class FruitStoreViewController: UIViewController{
    var fruitStore: FruitStore
    var labelDict: Dictionary<UILabel, Fruit>
    
    required init?(coder aDecoder: NSCoder) {
        self.fruitStore = FruitStore.shared
        self.labelDict = [:]
        super.init(coder: aDecoder)
    }
}

extension FruitStoreViewController {
    func configureFruitStoreUI() {
        labelDict.forEach { $0.text = fruitStore.fruitCount(fruit: $1).description }
    }
}
