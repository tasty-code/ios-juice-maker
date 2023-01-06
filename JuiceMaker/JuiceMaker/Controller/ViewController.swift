//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    let juiceMaker = JuiceMaker()

    @IBOutlet var stockLabels: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for stock in stockLabels {
            stock.text = String(FruitStore.defaultStock)
        }
    }
    
    @IBAction func orderButton(_ sender: UIButton) {
        
    }
}

