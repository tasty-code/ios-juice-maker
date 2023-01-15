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
    @IBAction func touchUpDismissButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @IBOutlet var fruitEmojiBundle: [UILabel]!
    @IBOutlet var fruitStoreCountBundle: [UILabel]!
    @IBOutlet var stepperBundle: [UIStepper]!
    
    @IBAction func stepperAction(_ sender: UIStepper) {
    }
    
    //MARK: - FruitViewController Property
    private let fruitStore = FruitStore.shared
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        syncFruitStocks()
        fruitStore.delegate = self
    }
}
