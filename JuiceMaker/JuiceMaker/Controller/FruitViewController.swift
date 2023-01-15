//
//  FruitViewController.swift
//  JuiceMaker
//
//  Created by Jason on 2023/01/11.
//

import UIKit

class FruitViewController: UIViewController, SendDataDelegate {
    //MARK: - SendDataDelegate Method
    func syncFruitStocks() {
        Fruit.allCases.enumerated().forEach { fruit in
            guard let label = fruitStoreCountBundle[safe: fruit.offset] else { return }
            label.text = String(fruitStore.sendBackToAvailableStock(fruit: fruit.element))
        }
    }
    
    //MARK: - Storyboard UI Outlet, Action
    @IBAction private func touchUpDismissButton(_ sender: UIBarButtonItem) {
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
        
        sender.autorepeat = false
        countLabel.text = String(changeStock)
    }
    
    //MARK: - FruitViewController Property
    private let fruitStore = FruitStore.shared
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        syncFruitStocks()
        fruitStore.delegate = self
        
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
    
    //MARK: - 재고 업데이트
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
