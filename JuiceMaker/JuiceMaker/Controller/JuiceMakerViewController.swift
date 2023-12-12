//
//  JuiceMaker - JuiceMakerViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class JuiceMakerViewController: UIViewController {
    
    private var stockDisplay: StockDisplay?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let fruitStore = FruitStore(initialCount: 10)
        self.stockDisplay = StockDisplay(fruitStore: fruitStore)
        setUp()
        stockDisplay?.displayStock()
        
    }
    
    
    private func setUp() {
        let stockDisplayConverter = StockDisplayResultConverter()
        self.stockDisplay?.resultConverter = stockDisplayConverter
        stockDisplayConverter.display = self
    }
    
    
    
    

}

extension JuiceMakerViewController: StockDisplayResultDisplayable {
    func displayStock(viewModel: StockDisplayModel.ViewModel) {
        
    }
}

