//
//  FruitStoreViewController.swift
//  JuiceMaker
//
//  Created by 최승범 on 2023/09/14.
//

import UIKit

class FruitStoreViewController: UIViewController {
    var fruitStore: FruitStore?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        initStepper()
        
    }
    
   
    @IBOutlet weak var storeStrawberryLabel: UILabel!
    
    @IBOutlet weak var storeBananaLabel: UILabel!
    
    @IBOutlet weak var storePineappleLabel: UILabel!
    
    @IBOutlet weak var storeKiwiLabel: UILabel!
    
    @IBOutlet weak var storeMangoLabel: UILabel!
    
    
    //MARK: - Stepper
    @IBOutlet weak var strawberryStepper: UIStepper!
    
    @IBOutlet weak var bananaStepper: UIStepper!
    
    @IBOutlet weak var pineappleStepper: UIStepper!
    
    @IBOutlet weak var kiwiStepper: UIStepper!
    
    @IBOutlet weak var mangoStepper: UIStepper!
    
    
 
    
    @IBAction func fruitStockStepper(_ sender: UIStepper) {
        do {
            guard let labelName = sender.accessibilityLabel else {
                print("labelName 바인딩 실패")
                return }

            guard let fruitStore = fruitStore else { return }
            
            guard let fruit = fruitStore.fruitList.filter({$0.name == labelName}).first else { return }
            
    
            try fruitStore.addFruitStock(inputFruit: fruit, count: Int(sender.value)) // n + 1
            
            updateUI()
        } catch {
            print("\(error)")
        }
    }
    
    
    private func initStepper() {
        guard let fruitStore = self.fruitStore else { return }
        strawberryStepper.accessibilityLabel = "딸기"
        strawberryStepper.value = Double(fruitStore.fruitList[0].stock)
        
        bananaStepper.accessibilityLabel = "바나나"
        bananaStepper.value = Double(fruitStore.fruitList[1].stock)
        
        pineappleStepper.accessibilityLabel = "파인애플"
        pineappleStepper.value = Double(fruitStore.fruitList[2].stock)
        
        kiwiStepper.accessibilityLabel = "키위"
        kiwiStepper.value = Double(fruitStore.fruitList[3].stock)
        
        mangoStepper.accessibilityLabel = "망고"
        mangoStepper.value = Double(fruitStore.fruitList[4].stock)
    }
    
    
    
    
    
    
    private func updateUI() {
        guard let fruitStore = self.fruitStore else { return }
        storeStrawberryLabel.text = String(fruitStore.fruitList[0].stock)
        storeBananaLabel.text = String(fruitStore.fruitList[1].stock)
        storePineappleLabel.text = String(fruitStore.fruitList[2].stock)
        storeKiwiLabel.text = String(fruitStore.fruitList[3].stock)
        storeMangoLabel.text = String(fruitStore.fruitList[4].stock)
        
    }
    
    
    
}

