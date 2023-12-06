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
        juiceMaker.makeJuice(Recipe.mangoKiwi)
        print("\(juiceMaker.store.fruits)")
        juiceMaker.makeJuice(Recipe.mangoKiwi)
        print("\(juiceMaker.store.fruits)")
        juiceMaker.makeJuice(Recipe.strawberry)
        fruitStore.supplyFruits(fruitName: "strawberry", quantity: 20)
        print("\(juiceMaker.store.fruits)")
        juiceMaker.makeJuice(Recipe.strawberry)
        print("\(juiceMaker.store.fruits)")
    }
}

