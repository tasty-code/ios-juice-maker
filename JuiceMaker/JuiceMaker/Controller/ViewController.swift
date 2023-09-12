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
        var test = JuiceMaker()
        test.currentStockCheck(.bananaJuice)
        print(test.fruitStorage.banana.currentStock)
    }
}

