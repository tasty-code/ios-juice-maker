//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class ViewController: UIViewController {
    
    // MARK: - Properties
    
    private let juiceMaker = JuiceMaker()
    
    // MARK: - Views
    
    @IBOutlet private var strawberryQuantityLabel: UILabel!
    @IBOutlet private var bananaQuantityLabel: UILabel!
    @IBOutlet private var pineappleQuantityLabel: UILabel!
    @IBOutlet private var kiwiQuantityLabel: UILabel!
    @IBOutlet private var mangoQuantityLabel: UILabel!
    
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
            guard let menu = JuiceMenu(rawValue: label.tag) else { continue }
            
            let fruitQuantity = juiceMaker.fruitStore.fruitDictionary[menu, default: 10]
            label.text = String(fruitQuantity)
        }
    }

    @IBAction func pressOrderButton(_ button: UIButton)  {
        guard let fruitName = JuiceMenu(rawValue: button.tag) else { return }
        juiceMaker.fruitStore.makeJuice(of: fruitName)
        
        displayFruitQuantity()
    }
}

