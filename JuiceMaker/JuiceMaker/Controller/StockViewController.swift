//
//  StockViewController.swift
//  JuiceMaker
//
//  Created by 전성수 on 2023/09/18.
//

import UIKit

protocol sendStockDelegate {
    func sendStock() -> JuiceMaker
}

final class StockViewController: UIViewController{
    
    var delegate: sendStockDelegate?

    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var pineappleStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        updateStockLabel()
        updateStepperValue()
    }

}

extension StockViewController {
    private func updateStepperValue()  {
        guard let stock = delegate?.sendStock() else {
            return
        }
        do {
            strawberryStepper.value = try stock.getStepperValue(.strawberry)
            bananaStepper.value = try stock.getStepperValue(.banana)
            pineappleStepper.value = try stock.getStepperValue(.pineapple)
            kiwiStepper.value = try stock.getStepperValue(.kiwi)
            mangoStepper.value = try stock.getStepperValue(.mango)
        } catch {
            print(error)
        }
    }
    
    private func updateStockLabel() {
        guard let stock = delegate?.sendStock() else {
            return
        }
        do {
            strawberryLabel.text = try stock.getRemainingFruits(.strawberry)
            bananaLabel.text = try stock.getRemainingFruits(.banana)
            pineappleLabel.text = try  stock.getRemainingFruits(.pineapple)
            kiwiLabel.text = try stock.getRemainingFruits(.kiwi)
            mangoLabel.text = try stock.getRemainingFruits(.mango)
        } catch {
            statusAlert(ErrorMessage.invalidInput.debugDescription)
        }
    }
    
    private func statusAlert(_ message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default)
        
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}

extension StockViewController {
    @IBAction func pressedStepper(_ sender: UIStepper) {
        guard let stock = delegate?.sendStock() else {
            return
        }
        stock.fruitStorage.stockManager(sender.tag, changedStock: sender.value)
        updateStepperValue()
        updateStockLabel()
    }
    
    @IBAction func goBack(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
}
