//
//  StockManagerViewController.swift
//  JuiceMaker
//
//  Created by Effie on 12/12/23.
//

import UIKit

final class StockManagerViewController: UIViewController {
    private let stockDisplayUseCase: StockDisplay?
    
    @IBOutlet private weak var strawberryStockLabel: UILabel!
    
    @IBOutlet private weak var bananaStockLabel: UILabel!
    
    @IBOutlet private weak var pineappleStockLabel: UILabel!
    
    @IBOutlet private weak var kiwiStockLabel: UILabel!
    
    @IBOutlet private weak var mangoStockLabel: UILabel!
    
    required init?(coder: NSCoder) {
        self.stockDisplayUseCase = nil
        super.init(coder: coder)
    }
    
    init?(coder: NSCoder, fruitStore: FruitStore) {
        self.stockDisplayUseCase = StockDisplay(fruitStore: fruitStore)
        super.init(coder: coder)
        setUpLayers()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stockDisplayUseCase?.displayStock()
    }
}

extension StockManagerViewController {
    @IBAction private func completeManaging(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
}

extension StockManagerViewController {
    private func setUpLayers() {
        let resultConverter = StockDisplayResultConverter()
        resultConverter.display = self
        stockDisplayUseCase?.resultConverter = resultConverter
    }
}

extension StockManagerViewController: StoryboardBased {
    static func instantiate(
        fruitStore: FruitStore
    ) -> Self {
        return sceneStoryboard.instantiateViewController(
            identifier: storyboardIdentifier
        ) { coder in
            return Self.init(
                coder: coder,
                fruitStore: fruitStore
            )
        }
    }
}

extension StockManagerViewController: StockDisplayResultDisplayable {
    func displayStock(viewModel: StockDisplayModel.ViewModel) {
        guard let eachFruitCount = viewModel.countOfEachFruits else { return }
        
        self.strawberryStockLabel.text = "\(eachFruitCount.strawberryCount)"
        self.bananaStockLabel.text = "\(eachFruitCount.bananaCount)"
        self.pineappleStockLabel.text = "\(eachFruitCount.pineappleCount)"
        self.kiwiStockLabel.text = "\(eachFruitCount.kiwiCount)"
        self.mangoStockLabel.text = "\(eachFruitCount.mangoCount)"
    }
}

