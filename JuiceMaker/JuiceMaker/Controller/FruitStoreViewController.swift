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
        setStepperLabel()
        
        print("화면 2 : \(fruitStore!.fruitList)")
    }
    
   
    @IBOutlet weak var storeStrawberryLabel: UILabel!
    
    @IBOutlet weak var storeBananaLabel: UILabel!
    
    @IBOutlet weak var storePineappleLabel: UILabel!
    
    @IBOutlet weak var storeKiwiLabel: UILabel!
    
    @IBOutlet weak var storeMangoLabel: UILabel!
    
    
    //MARK: - Stepper
    @IBOutlet weak var strawberryStepper: UIStepper!
    
    @IBOutlet weak var bananStepper: UIStepper!
    
   
    
    @IBAction func backToJuiceMakerView(_ sender: UIButton) {
        dismiss(animated: true)
    }
    

    
    @IBAction func fruitStockStepper(_ sender: UIStepper) {
        do {
            guard let labelName = sender.accessibilityLabel else {
                print("labelName 바인딩 실패")
                return }

            guard let fruitStore = fruitStore else { return }
            
            guard let fruit = fruitStore.fruitList.filter({$0.name == labelName}).first else { return }
            
            
            
            try fruitStore.addFruitStock(inputFruit: fruit, count: 1) // n + 1
            
            updateUI()
        } catch {
            print("\(error)")
        }
    }
    
    
    private func setStepperLabel() {
        strawberryStepper.accessibilityLabel = "딸기"
    }
    
    
    
    
    
    
    private func updateUI() {
        guard let bindingFruitStore = fruitStore else { return }
        storeStrawberryLabel.text = String(bindingFruitStore.fruitList[0].stock)
        
        storeBananaLabel.text = String(bindingFruitStore.fruitList[1].stock)
        storePineappleLabel.text = String(bindingFruitStore.fruitList[2].stock)
        storeKiwiLabel.text = String(bindingFruitStore.fruitList[3].stock)
        storeMangoLabel.text = String(bindingFruitStore.fruitList[4].stock)
        
    }
}
