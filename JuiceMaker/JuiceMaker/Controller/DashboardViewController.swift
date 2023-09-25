//
//  DashboardViewController.swift
//  JuiceMaker
//
//  Created by JaeHyeok Sim on 2023/09/18.
//

import UIKit

protocol DashboardViewControllerDelegate: AnyObject {
    func didUpdateData()
}

final class DashboardViewController: UIViewController {
    weak var delegate: DashboardViewControllerDelegate?
    var juiceMakerModel: JuiceMaker?
    
    @IBOutlet private weak var strawberryLabel: UILabel!
    @IBOutlet private weak var bananaLabel: UILabel!
    @IBOutlet private weak var pineappleLabel: UILabel!
    @IBOutlet private weak var kiwiLabel: UILabel!
    @IBOutlet private weak var mangoLabel: UILabel!
    
    @IBOutlet private weak var strawberryStepper: UIStepper!
    @IBOutlet private weak var bananaStepper: UIStepper!
    @IBOutlet private weak var pineappleStepper: UIStepper!
    @IBOutlet private weak var kiwiStepper: UIStepper!
    @IBOutlet private weak var mangoStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStockLabel()
    }
    
    @IBAction private func closeButtonTapped(_ sender: UIButton) {
        delegate?.didUpdateData()
        dismiss(animated: true)
    }
    
    @IBAction private func didStepperTapped(_ sender: UIStepper) {
        guard let juiceMaker = juiceMakerModel else {
            return
        }
        
        switch Fruit(rawValue: sender.tag) {
        case .strawberry:
            juiceMaker.updateFruitStock(fruit: .strawberry, amount: sender.value)
            strawberryLabel.text = Int(sender.value).description
        case .banana:
            juiceMaker.updateFruitStock(fruit: .banana, amount: sender.value)
            bananaLabel.text = Int(sender.value).description
        case .kiwi:
            juiceMaker.updateFruitStock(fruit: .kiwi, amount: sender.value)
            kiwiLabel.text = Int(sender.value).description
        case .mango:
            juiceMaker.updateFruitStock(fruit: .mango, amount: sender.value)
            mangoLabel.text = Int(sender.value).description
        case .pineapple:
            juiceMaker.updateFruitStock(fruit: .pineapple, amount: sender.value)
            pineappleLabel.text = Int(sender.value).description
        default:
            break
        }
    }
    
    private func setStockLabel() {
        guard let juiceMaker = juiceMakerModel else {
            return
        }
        
        let fruitStocks = juiceMaker.getAllStocks()
       
        for (fruit, amount) in fruitStocks {
            switch fruit {
            case .banana:
                bananaLabel.text = String(amount)
                bananaStepper.value = Double(amount)
            case .strawberry:
                strawberryLabel.text = String(amount)
                strawberryStepper.value = Double(amount)
            case .kiwi:
                kiwiLabel.text = String(amount)
                kiwiStepper.value = Double(amount)
            case .mango:
                mangoLabel.text = String(amount)
                mangoStepper.value = Double(amount)
            case .pineapple:
                pineappleLabel.text = String(amount)
                pineappleStepper.value = Double(amount)
            }
        }
    }
}
