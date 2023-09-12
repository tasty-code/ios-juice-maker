//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class ViewController: UIViewController {
    
    // MARK: - Properties
    
    private var juiceMaker = JuiceMaker()
    
    // MARK: - Views
    
    @IBOutlet var strawberryQuantityLabel: UILabel!
    @IBOutlet var bananaQuantityLabel: UILabel!
    @IBOutlet var pineappleQuantityLabel: UILabel!
    @IBOutlet var kiwiQuantityLabel: UILabel!
    @IBOutlet var mangoQuantityLabel: UILabel!
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayFruitQuantity()
    }

    // MARK: - Methods
    
    private func displayFruitQuantity() {
        juiceMaker.fruitStore.fetchFruitStock()
        
        let fruitQuantityLabels = [strawberryQuantityLabel,
                                   bananaQuantityLabel,
                                   pineappleQuantityLabel,
                                   kiwiQuantityLabel,
                                   mangoQuantityLabel]
        
        let fruitDictionary = juiceMaker.fruitStore.fruitDictionary
        
        for i in 0..<fruitQuantityLabels.count {
            let name = juiceMaker.fruitStore.fruitNames[i]
            
            fruitQuantityLabels[i]?.text = String(fruitDictionary[name, default: 10])
        }
    }
}

