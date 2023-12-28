//
//  StockManagerViewController.swift
//  JuiceMaker
//
//  Created by Effie on 12/12/23.
//

import UIKit

final class StockManagerViewController: UIViewController {
    private let stockManagerUseCase: StockManager?
    
    private weak var coordinator: StockManagerViewControllerDelegate?
    
    @IBOutlet private weak var strawberryStockLabel: UILabel!
    
    @IBOutlet private weak var bananaStockLabel: UILabel!
    
    @IBOutlet private weak var pineappleStockLabel: UILabel!
    
    @IBOutlet private weak var kiwiStockLabel: UILabel!
    
    @IBOutlet private weak var mangoStockLabel: UILabel!
    
    @IBOutlet private weak var strawberryCountStepper: UIStepper!
    
    @IBOutlet private weak var bananaCountStepper: UIStepper!
    
    @IBOutlet private weak var pineappleCountStepper: UIStepper!
    
    @IBOutlet private weak var kiwiCountStepper: UIStepper!
    
    @IBOutlet private weak var mangoCountStepper: UIStepper!
    
    required init?(coder: NSCoder) {
        self.stockManagerUseCase = nil
        self.coordinator = nil
        super.init(coder: coder)
    }
    
    private init?(
        coder: NSCoder,
        stockManagerUseCase: StockManager,
        coordinator: StockManagerViewControllerDelegate?
    ) {
        self.stockManagerUseCase = stockManagerUseCase
        self.coordinator = coordinator
        super.init(coder: coder)
        setUpLayers()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stockManagerUseCase?.displayStock()
    }
}

extension StockManagerViewController {
    @IBAction func changeStockCount(_ sender: UIStepper) {
        let fruitType: Fruit
        switch sender {
        case strawberryCountStepper:
            fruitType = .strawberry
        case bananaCountStepper:
            fruitType = .banana
        case pineappleCountStepper:
            fruitType = .pineapple
        case kiwiCountStepper:
            fruitType = .kiwi
        case mangoCountStepper:
            fruitType = .mango
        default:
            return
        }
        let newCount = Int(sender.value)
        self.stockManagerUseCase?.updateStock(of: fruitType, to: newCount)
    }
    
    @IBAction private func completeManaging(_ sender: UIBarButtonItem) {
        self.coordinator?.endStockManaging()
    }
}

extension StockManagerViewController {
    private func setUpLayers() {
        let stockManagerResultConverter = StockManagerResultConverter()
        stockManagerResultConverter.display = self
        stockManagerUseCase?.resultConverter = stockManagerResultConverter
    }
    
    private func setUI() {
        [
            strawberryCountStepper,
            bananaCountStepper,
            pineappleCountStepper,
            kiwiCountStepper,
            mangoCountStepper,
        ].forEach { stepper in
            stepper?.stepValue = 1.0
            stepper?.minimumValue = 0
        }
    }
}

extension StockManagerViewController: StoryboardBased {
    static func instantiate(
        stockManagerUseCase: StockManager,
        coordinator: StockManagerViewControllerDelegate?
    ) -> Self {
        return sceneStoryboard.instantiateViewController(
            identifier: storyboardIdentifier
        ) { coder in
            return Self.init(
                coder: coder,
                stockManagerUseCase: stockManagerUseCase,
                coordinator: coordinator
            )
        }
    }
}

extension StockManagerViewController: StockDisplayResultDisplayable {
    func displayStock(viewModel: StockDisplayModel.ViewModel) {
        switch viewModel {
        case .success(let eachFruitCount):
            self.strawberryStockLabel.text = "\(eachFruitCount.strawberryCount)"
            self.bananaStockLabel.text = "\(eachFruitCount.bananaCount)"
            self.pineappleStockLabel.text = "\(eachFruitCount.pineappleCount)"
            self.kiwiStockLabel.text = "\(eachFruitCount.kiwiCount)"
            self.mangoStockLabel.text = "\(eachFruitCount.mangoCount)"
            
            self.strawberryCountStepper.value = Double(eachFruitCount.strawberryCount)
            self.bananaCountStepper.value = Double(eachFruitCount.bananaCount)
            self.pineappleCountStepper.value = Double(eachFruitCount.pineappleCount)
            self.kiwiCountStepper.value = Double(eachFruitCount.kiwiCount)
            self.mangoCountStepper.value = Double(eachFruitCount.mangoCount)
        case .failure:
            return
        }
    }
}

extension StockManagerViewController: StockManagerResultDisplayable {
    func displayModifiedStock(viewModel: StockManagerModel.ViewModel) {
        switch viewModel {
        case .success(let newStock):
            switch newStock.fruitType {
            case .strawberry:
                strawberryStockLabel.text = "\(newStock.count)"
            case .banana:
                bananaStockLabel.text = "\(newStock.count)"
            case .pineapple:
                pineappleStockLabel.text = "\(newStock.count)"
            case .kiwi:
                kiwiStockLabel.text = "\(newStock.count)"
            case .mango:
                mangoStockLabel.text = "\(newStock.count)"
            }
        case .failure:
            return
        }
    }
}
