//
//  JuiceMaker - ViewController.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var fruitStore = FruitStore()
    lazy var juiceMaker = JuiceMaker(store: self.fruitStore)
   
    override func viewDidLoad() {
        super.viewDidLoad()
        juiceMaker.showMenu()
        juiceMaker.order(Recipe.mangoKiwi)
        juiceMaker.order(Recipe.mangoKiwi)
        juiceMaker.order(Recipe.strawberry)
        fruitStore.supplyFruits(fruitName: Fruit.strawberry.rawValue, quantity: 20)
        juiceMaker.order(Recipe.strawberry)
        juiceMaker.order(Recipe.mango)
        juiceMaker.order(Recipe.mango)
        juiceMaker.order(Recipe.mango)
        fruitStore.supplyFruits(fruitName: Fruit.mango.rawValue, quantity: 15)
    }
}

