//
//  FruitsStockViewController.swift
//  JuiceMaker
//
//  Created by Kyle& L
//

import UIKit

final class FruitStoreViewController: UIViewController {
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var pinappleStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
    
    private let fruitStore: FruitStore
    weak var delegate: FruitStockDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setStockLabelUI()
        setStepperValue()
    }
    
    init?(fruitStore: FruitStore, coder: NSCoder) {
        self.fruitStore = fruitStore
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        self.navigationItem.hidesBackButton = true
        self.navigationItem.title = "재고추가"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "닫기",
                                                                 style: .plain,
                                                                 target: self,
                                                                 action: #selector(tappedCloseButton))
    }
    
    private func setStockLabelUI() {
        guard
            let strawberryStock = fruitStore.fruitStocks[.strawberry],
            let bananaStock = fruitStore.fruitStocks[.banana],
            let pineappleStock = fruitStore.fruitStocks[.pineapple],
            let kiwiStock = fruitStore.fruitStocks[.kiwi],
            let mangoStock = fruitStore.fruitStocks[.mango]
        else {
            return
        }
        strawberryStockLabel.text = String(strawberryStock)
        bananaStockLabel.text = String(bananaStock)
        pineappleStockLabel.text = String(pineappleStock)
        kiwiStockLabel.text = String(kiwiStock)
        mangoStockLabel.text = String(mangoStock)
    }
    
    private func setStepperValue() {
        guard
            let strawberryStock = fruitStore.fruitStocks[.strawberry],
            let bananaStock = fruitStore.fruitStocks[.banana],
            let pineappleStock = fruitStore.fruitStocks[.pineapple],
            let kiwiStock = fruitStore.fruitStocks[.kiwi],
            let mangoStock = fruitStore.fruitStocks[.mango]
        else {
            return
        }
        strawberryStepper.value = Double(strawberryStock)
        bananaStepper.value = Double(bananaStock)
        pinappleStepper.value = Double(pineappleStock)
        kiwiStepper.value = Double(kiwiStock)
        mangoStepper.value = Double(mangoStock)
    }
    
    @IBAction private func tappedStrawberryStepper(_ sender: UIStepper) {
        strawberryStockLabel.text = String(Int(sender.value))
        fruitStore.fruitStocks[.strawberry] = Int(sender.value)
    }
    
    @IBAction private func tappedBananaStepper(_ sender: UIStepper) {
        bananaStockLabel.text = String(Int(sender.value))
        fruitStore.fruitStocks[.banana] = Int(sender.value)
    }
    
    @IBAction private func tappedPineappleStepper(_ sender: UIStepper) {
        pineappleStockLabel.text = String(Int(sender.value))
        fruitStore.fruitStocks[.pineapple] = Int(sender.value)
    }
    
    @IBAction private func tappedKiwiStepper(_ sender: UIStepper) {
        kiwiStockLabel.text = String(Int(sender.value))
        fruitStore.fruitStocks[.kiwi] = Int(sender.value)
    }
    
    @IBAction private func tappedMangoStepper(_ sender: UIStepper) {
        mangoStockLabel.text = String(Int(sender.value))
        fruitStore.fruitStocks[.mango] = Int(sender.value)
    }

    @IBAction private func tappedCloseButton(_ sender: UIButton) {
        delegate?.updateFruitStock()
        dismiss(animated: true)
    }
}
