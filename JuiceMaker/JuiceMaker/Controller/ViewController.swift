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
    
    override func viewWillAppear(_ animated: Bool) {
        displayFruitQuantity()
    }
    
    // MARK: - Methods
    
    private func displayFruitQuantity() {
        let fruitQuantityLabels: [UILabel] = [strawberryQuantityLabel,
                                              bananaQuantityLabel,
                                              pineappleQuantityLabel,
                                              kiwiQuantityLabel,
                                              mangoQuantityLabel]
        
        for label in fruitQuantityLabels {
            guard let name = JuiceMenu(rawValue: label.tag) else { return }
            
            let fruitQuantity = juiceMaker.fruitStore.fruitDictionary[name, default: 10]
            label.text = String(fruitQuantity)
        }
    }

    @IBAction func pressOrderButton(_ button: UIButton)  {
        guard let fruitName = JuiceMenu(rawValue: button.tag) else { return }
        juiceMaker.fruitStore.makeJuice(of: fruitName)
        
        displayFruitQuantity()
    }
}

