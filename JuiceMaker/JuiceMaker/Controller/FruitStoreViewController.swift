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
        initStepper()
        updateUI()
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
            guard let stepperTag = StepperTag(rawValue: sender.tag) else { return }
            
            guard let fruitStore = fruitStore else { return }
            
            guard let fruit = fruitStore.fruitList.filter({$0.name == stepperTag.fruitName}).first else { return }
            
    
            try fruitStore.addFruitStock(inputFruit: fruit, count: Int(sender.value))
            
            updateUI()
            
        } catch {
            print("\(error)")
        }
    }
    
}


//MARK: - Method
extension FruitStoreViewController {
    
    private func initStepper() {
        guard let fruitStore = self.fruitStore else { return }
        
        strawberryStepper.value = Double(fruitStore.fruitList[0].stock)
        bananaStepper.value = Double(fruitStore.fruitList[1].stock)
        pineappleStepper.value = Double(fruitStore.fruitList[2].stock)
        kiwiStepper.value = Double(fruitStore.fruitList[3].stock)
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

extension FruitStoreViewController {
    
    private enum StepperTag: Int {
        case strawberryStepperTag = 0
        case bananaStepperTag = 1
        case pineappleStepperTag = 2
        case kiwiStepperTag = 3
        case mangoStepperTag = 4
        
        var fruitName: String {
            switch self {
            case .strawberryStepperTag:
                return "딸기"
            case .bananaStepperTag:
                return "바나나"
            case .pineappleStepperTag:
                return "파인애플"
            case .kiwiStepperTag:
                return "키위"
            case .mangoStepperTag:
                return "망고"
            }
        }
        
    }
}
