//
//  StoreViewController.swift
//  JuiceMaker
//
//  Created by 조용현 on 2023/01/06.
//

import UIKit

class StoreViewController: UIViewController, FruitView {
    
    @IBOutlet var fruitStockLabels: [UILabel]!
    
    var fruitStore: FruitStore?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabels(of: Fruit.allCases)
    }
    
    @IBAction func touchesBackButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
}

extension StoreViewController {
    func updateLabels(of fruits:[Fruit]){
        guard let labels = fruitStockLabels as? [FruitComponent],
              let stocks = fruitStore?.stockInfo(of: fruits) else { return }
        
        update(targets: labels, with: stocks)
    }
}
