//
//  JuiceMaker - JuiceMakerViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class JuiceMakerViewController: UIViewController {
    
    private let stockDisplay: StockDisplay?
    
    private let juiceMaker: JuiceMaker?
    
    private let router: JuiceMakerRoutable?
    
    @IBOutlet private weak var strawberryStockLabel: UILabel!
    
    @IBOutlet private weak var bananaStockLabel: UILabel!
    
    @IBOutlet private weak var pineappleStockLabel: UILabel!
    
    @IBOutlet private weak var kiwiStockLabel: UILabel!
    
    @IBOutlet private weak var mangoStockLabel: UILabel!
    
    required init?(coder: NSCoder) {
        self.stockDisplay = nil
        self.juiceMaker = nil
        self.router = nil
        
        super.init(coder: coder)
    }
    
    init?(coder: NSCoder, fruitStore: FruitStore) {
        self.stockDisplay = StockDisplay(fruitStore: fruitStore)
        self.juiceMaker = JuiceMaker(fruitStore: fruitStore)
        self.router = JuiceMakerRouter(dataStore: fruitStore)
        super.init(coder: coder)
        setUp()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        stockDisplay?.displayStock()
    }
    
    @IBAction private func makeStrawberryBananaJuice(_ sender: UIButton) {
        juiceMaker?.makeJuice(flavor: .strawberryBanana)
    }
    
    @IBAction private func makeMangoKiwiJuice(_ sender: UIButton) {
        juiceMaker?.makeJuice(flavor: .mangoKiwi)
    }
    
    @IBAction private func makeStrawberryJuice(_ sender: UIButton) {
        juiceMaker?.makeJuice(flavor: .strawberry)
    }
    
    @IBAction private func makeBananaJuice(_ sender: UIButton) {
        juiceMaker?.makeJuice(flavor: .banana)
    }
    
    @IBAction private func makePineappleJuice(_ sender: UIButton) {
        juiceMaker?.makeJuice(flavor: .pineapple)
    }
    
    @IBAction private func makeKiwiJuice(_ sender: UIButton) {
        juiceMaker?.makeJuice(flavor: .kiwi)
    }
    
    @IBAction private func makeMangoJuice(_ sender: UIButton) {
        juiceMaker?.makeJuice(flavor: .mango)
    }
    
    @IBAction private func moveToStockManager(_ sender: UIBarButtonItem) {
        self.router?.routeToNextViewController()
    }
    
    private func setUp() {
        let stockDisplayConverter = StockDisplayResultConverter()
        self.stockDisplay?.resultConverter = stockDisplayConverter
        stockDisplayConverter.display = self
        
        let juiceConverter = JuiceMakerResultConverter()
        self.juiceMaker?.resultConverter = juiceConverter
        juiceConverter.display = self
        
        self.router?.sourceViewController = self
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
            let action: AlertActionHandler = { [weak self] _ in
                self?.router?.routeToNextViewController()
            }
            present(JuiceMakerAlert.fruitShortage(editAction: action).alertController, animated: true)
            return
        }
        
        stockDisplay?.displayStock()
        
        present(JuiceMakerAlert.juiceIsReady(juiceName: juiceName).alertController, animated: true)
    }
}
