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
        juiceMaker.order(Recipe.mangoKiwi)
        print("\(juiceMaker.store.fruits)")
        juiceMaker.order(Recipe.mangoKiwi)
        print("\(juiceMaker.store.fruits)")
        juiceMaker.order(Recipe.strawberry)
        fruitStore.supplyFruits(fruitName: "strawberry", quantity: 20)
        print("\(juiceMaker.store.fruits)")
        juiceMaker.order(Recipe.strawberry)
        print("\(juiceMaker.store.fruits)")
        juiceMaker.order(Recipe.strawberryBanana)
        juiceMaker.order(Recipe.strawberryBanana)
        juiceMaker.order(Recipe.strawberryBanana)
    }
}

