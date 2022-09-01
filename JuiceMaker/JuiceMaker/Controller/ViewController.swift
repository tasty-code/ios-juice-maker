//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    let fruitStore = FruitStore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fruitStore.addStock(fruit: .strawberry, stock: 10)
        
        // Do any additional setup after loading the view.
    }

    

}

