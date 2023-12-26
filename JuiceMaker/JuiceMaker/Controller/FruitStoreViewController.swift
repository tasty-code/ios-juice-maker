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
    weak var delegate: FruitStoreDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setUpContents()
    }
    
    init?(fruitStore: FruitStore, coder: NSCoder) {
        self.fruitStore = fruitStore
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        navigationItem.hidesBackButton = true
        navigationItem.title = "재고추가"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "닫기",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(tappedCloseButton))
    }
    
    private func setUpContents() {
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
        
        strawberryStepper.value = Double(strawberryStock)
        bananaStepper.value = Double(bananaStock)
        pinappleStepper.value = Double(pineappleStock)
        kiwiStepper.value = Double(kiwiStock)
        mangoStepper.value = Double(mangoStock)
    }
    
    private func updateFruitStock(label: UILabel, fruit: Fruits, count: Int) {
        label.text = String(count)
        fruitStore.fruitStocks[fruit] = count
    }
    
    @IBAction private func tappedStrawberryStepper(_ sender: UIStepper) {
        updateFruitStock(label: strawberryStockLabel,
                         fruit: .strawberry,
                         count: Int(sender.value))
    }
    
    @IBAction private func tappedBananaStepper(_ sender: UIStepper) {
        updateFruitStock(label: bananaStockLabel,
                         fruit: .banana,
                         count: Int(sender.value))
    }
    
    @IBAction private func tappedPineappleStepper(_ sender: UIStepper) {
        updateFruitStock(label: pineappleStockLabel,
                         fruit: .pineapple,
                         count: Int(sender.value))
    }
    
    @IBAction private func tappedKiwiStepper(_ sender: UIStepper) {
        updateFruitStock(label: kiwiStockLabel,
                         fruit: .kiwi,
                         count: Int(sender.value))
    }
    
    @IBAction private func tappedMangoStepper(_ sender: UIStepper) {
        updateFruitStock(label: mangoStockLabel,
                         fruit: .mango,
                         count: Int(sender.value))
    }
    
    @IBAction private func tappedCloseButton(_ sender: UIBarButtonItem) {
        delegate?.updateFruitStock()
        dismiss(animated: true)
    }
}
