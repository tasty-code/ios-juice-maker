//
//  StockManagerViewController.swift
//  JuiceMaker
//
//  Created by Effie on 12/12/23.
//

import UIKit

final class StockManagerViewController: UIViewController {
    @IBOutlet private weak var strawberryStockLabel: UILabel!
    
    @IBOutlet private weak var bananaStockLabel: UILabel!
    
    @IBOutlet private weak var pineappleStockLabel: UILabel!
    
    @IBOutlet private weak var kiwiStockLabel: UILabel!
    
    @IBOutlet private weak var mangoStockLabel: UILabel!
    
    private let stockDisplay: StockDisplay?
    
    required init?(coder: NSCoder) {
        self.stockDisplay = nil
        super.init(coder: coder)
    }
    
    init?(coder: NSCoder, fruitStore: FruitStore) {
        self.stockDisplay = StockDisplay(fruitStore: fruitStore)
        super.init(coder: coder)
        setUp()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stockDisplay?.displayStock()
    }
    
    @IBAction private func completeManaging(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    private func setUp() {
        let resultConverter = StockDisplayResultConverter()
        resultConverter.display = self
        stockDisplay?.resultConverter = resultConverter
    }
}

extension StockManagerViewController: StoryboardIdentifiable { }

extension StockManagerViewController: StockDisplayResultDisplayable {
    func displayStock(viewModel: StockDisplayModel.ViewModel) {
        guard let eachFruitCount = viewModel.eachFruitCount else { return }
        
        self.strawberryStockLabel.text = "\(eachFruitCount.strawberryCount)"
        self.bananaStockLabel.text = "\(eachFruitCount.bananaCount)"
        self.pineappleStockLabel.text = "\(eachFruitCount.pineappleCount)"
        self.kiwiStockLabel.text = "\(eachFruitCount.kiwiCount)"
        self.mangoStockLabel.text = "\(eachFruitCount.mangoCount)"
    }
}

