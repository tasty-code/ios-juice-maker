//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let firstClass:JuiceMaker = JuiceMaker(fruitStore: FruitStore(fruits: [
            FruitStore.Fruit(name: "딸기")
        ]))
        
        
        let secondClass: JuiceMaker = JuiceMaker(fruitStore: FruitStore(fruits: [
            FruitStore.Fruit(name: "복숭아")
        ]))
        
    }
    
}

