//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    private let juiceMaker = JuiceMaker()
    var currentQuantity: [Fruit : Int] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getStockList()
    }
    
    @IBOutlet var fruitsLabel: [UILabel]!
    
    func getStockList() {
        self.currentQuantity = juiceMaker.passCurrentList()
        for (fruit, _) in currentQuantity {
            guard let fruitLabelText = currentQuantity[fruit] else {
                return
            }
            
            fruitsLabel[fruit.rawValue].text = String(fruitLabelText)
        }
    }
}

