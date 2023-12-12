//
//  JuiceMaker - JuiceMakerViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class JuiceMakerViewController: UIViewController {
    
    private var stockDisplay: StockDisplay?
    
    private var juiceMaker: JuiceMaker?
    
    @IBOutlet private weak var strawberryStockLabel: UILabel!
    
    @IBOutlet private weak var bananaStockLabel: UILabel!
    
    @IBOutlet private weak var pineappleStockLabel: UILabel!
    
    @IBOutlet private weak var kiwiStockLabel: UILabel!
    
    @IBOutlet private weak var mangoStockLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let fruitStore = FruitStore(initialCount: 10)
        self.stockDisplay = StockDisplay(fruitStore: fruitStore)
        self.juiceMaker = JuiceMaker(fruitStore: fruitStore)
        
        setUp()
        stockDisplay?.displayStock()
    }
    
    
    @IBAction func makeStrawberryBananaJuice(_ sender: UIButton) {
        juiceMaker?.makeJuice(flavor: .strawberryBanana)
    }
    
    @IBAction func makeMangoKiwiJuice(_ sender: UIButton) {
        juiceMaker?.makeJuice(flavor: .mangoKiwi)
    }
    
    @IBAction func makeStrawberryJuice(_ sender: UIButton) {
        juiceMaker?.makeJuice(flavor: .strawberry)
    }
    
    @IBAction func makeBananaJuice(_ sender: UIButton) {
        juiceMaker?.makeJuice(flavor: .banana)
    }
    
    @IBAction func makePineappleJuice(_ sender: UIButton) {
        juiceMaker?.makeJuice(flavor: .pineapple)
    }
    
    @IBAction func makeKiwiJuice(_ sender: UIButton) {
        juiceMaker?.makeJuice(flavor: .kiwi)
    }
    
    @IBAction func makeMangoJuice(_ sender: UIButton) {
        juiceMaker?.makeJuice(flavor: .mango)
    }
    
    
    private func setUp() {
        let stockDisplayConverter = StockDisplayResultConverter()
        self.stockDisplay?.resultConverter = stockDisplayConverter
        stockDisplayConverter.display = self
        
        let juiceConverter = JuiceMakerResultConverter()
        self.juiceMaker?.resultConverter = juiceConverter
        juiceConverter.display = self
    }
    

}

extension JuiceMakerViewController: StoryboardIdentifiable { }

extension JuiceMakerViewController: StockDisplayResultDisplayable {
    func displayStock(viewModel: StockDisplayModel.ViewModel) {
        guard let eachFruitCount = viewModel.eachFruitCount else { return }
        
        self.strawberryStockLabel.text = "\(eachFruitCount.strawberryCount)"
        self.bananaStockLabel.text = "\(eachFruitCount.bananaCount)"
        self.pineappleStockLabel.text = "\(eachFruitCount.pineappleCount)"
        self.kiwiStockLabel.text = "\(eachFruitCount.kiwiCount)"
        self.mangoStockLabel.text = "\(eachFruitCount.mangoCount)"
    }
}

extension JuiceMakerViewController: JuiceMakerResultDisplayable {
    func displayMakingResult(viewModel: JuiceMakerModel.ViewModel) {
        guard let juiceName = viewModel.juiceName else {
            let action: AlertActionHandler = { [weak self] _ in }
            present(JuiceMakerAlert.fruitShortage(editAction: action).alertController, animated: true)
            return
        }
        
        stockDisplay?.displayStock()
        
        present(JuiceMakerAlert.juiceIsReady(juiceName: juiceName).alertController, animated: true)
    }
}
