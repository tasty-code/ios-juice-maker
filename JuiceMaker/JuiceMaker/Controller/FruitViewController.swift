//
//  FruitViewController.swift
//  JuiceMaker
//
//  Created by Jason on 2023/01/11.
//

import UIKit

class FruitViewController: UIViewController {
    //MARK: - Storyboard UI Outlet, Action
    @IBAction private func touchUpDismissButton(_ sender: UIBarButtonItem) {
        if isStockChange {
            delegate?.syncFruitStocks()
        }
        dismiss(animated: true)
    }
    
    @IBOutlet private var fruitStoreCountBundle: [UILabel]!
    @IBOutlet private var stepperBundle: [UIStepper]!
    
    @IBAction private func stepperAction(_ sender: UIStepper) {
        // sender로 들어온 과일타입에 해당하는 stepper 추출
        guard let stepper = sender as? Gettable else {
            return
        }
        let senderFruit = stepper.fruit
        let changeStock = Int(sender.value)
        
        // countLabel을 통해 위 sender와 동일한 과일 타입의 Label을 추출
        guard let countLabel = countLabel(of: senderFruit) else {
            return
        }
        fruitStore.updateStepper(of: senderFruit, to: changeStock)
        sender.autorepeat = false
        countLabel.text = String(changeStock)
        
        isStockChange = true
    }
    
    //MARK: - FruitViewController Property
    private let fruitStore = FruitStore.shared
    private var isStockChange = false
    weak var delegate: SendDataDelegate?
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Fruit: CountLabel 추출
    private func countLabel(of fruit: Fruit) -> UILabel? {
        return fruitStoreCountBundle.first { countLable in
            guard let fruitLabel = countLable as? Gettable else {
                return false
            }
            return fruitLabel.fruit == fruit
        }
    }
    
    //MARK: - Stock Update
    private func configureUI() {
        updateOfStockCountLabels()
        updateOfStockSteppers()
    }
    
    private func updateOfStockCountLabels() {
        for countLabel in fruitStoreCountBundle {
            guard let label = countLabel as? Gettable else { return }
            let fruit = label.fruit
            
            guard let fruitStock = FruitStore.shared.store[fruit] else { return }
            countLabel.text = String(fruitStock)
        }
    }
    
    private func updateOfStockSteppers() {
        for stockStepper in stepperBundle {
            guard let stepper = stockStepper as? Gettable else { return }
            let fruit = stepper.fruit
            
            guard let fruitStock = FruitStore.shared.store[fruit] else { return }
            stockStepper.value = Double(fruitStock)
        }
    }
}
